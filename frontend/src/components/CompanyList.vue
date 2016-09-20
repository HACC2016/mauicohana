<template>


    <div>

        <div class="loading" v-show="loading" >
            <i class="fa fa-spinner fa-spin"></i>
        </div>

        <div class="feed">

            <div class="company-list-view" v-show="!loading" transition="fade">

                <div class="float-left" v-if="listings.meta"><strong class="count">{{listings.meta.count}}</strong> Vendors Found</div>
				<div class="text-right float-right"><a
                        class="inverse" v-link="{'path': '/products-vendors/new'}" title="New Vendor">
                    <small><i class="fa fa-plus" aria-hidden="true"></i> new vendor</small>
                </a><span class="sep"> | </span><a class="inverse" href="#map" title="Show Map">
                    <small><i class="fa fa-map-o" aria-hidden="true"></i> show map</small>
                </a>
                </div>
                <hr class="transparent">

                <div class="column row product card" v-for="listing in listings.data">
                    <article class="hentry type-entry">
						
                        <a rel="bookmark" v-link="{'path': '/products-vendors/details/' + listing.id}" :title="listing.name" class="block">
                            <header class="entry-header">
                                <h2 class="entry-title">
                                    <!--- <i class="fa fa-leaf block" aria-hidden="true"></i> ----> {{ listing.name }}
                                </h2>
                            </header>
                        </a>
                        <div class="entry-content">
                            <div>{{ listing.address }}, {{ listing.state }} {{ listing.zip}}
                                ({{listing.island}})
                            </div>

                            <span class="product " v-if="listing.phone_1">{{listing.phone_1}}</span>
                            <span class="product " v-if="listing.phone_2"> | {{listing.phone_2}}</span>

                            <div v-if="listing.email"><a href="#" @click.prevent="emailModal(listing)" class=" ink"><i class="fa fa-envelope"></i> email</a></div>

                        </div>
							
                        <div class="entry-footer" v-if="listing.products">
                            <div class="entry-meta">
                                <div class="company_product_list" v-for="category in listing.products | fix_json">
                                    <div class="product_category_wrapper" v-show="category.relevant">
                                        <p class="product-category">{{ category.category_name }}</p>
                                        <div class="category_products">
                                            <span class="product secondary label" v-for="product in category.products" track-by="$index">
                                                {{ product }}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>

                <div class="pagination">
                    <ul class="pagination" role="navigation" aria-label="Pagination">
                        <li class="pagination-previous disabled">Previous</li>
                        <li class="current"><span class="show-for-sr">You're on page</span> 1</li>
                        <li><a href="#" aria-label="Page 2">2</a></li>
                        <li><a href="#" aria-label="Page 3">3</a></li>
                        <li><a href="#" aria-label="Page 4">4</a></li>
                        <li class="ellipsis"></li>
                        <li><a href="#" aria-label="Page 12">12</a></li>
                        <li><a href="#" aria-label="Page 13">13</a></li>
                        <li class="pagination-next"><a href="#" aria-label="Next page">Next</a></li>
                    </ul>
                </div>


            </div>

        </div><!-- .feed -->


    </div>

</template>

<script>
    import {fetchCompanies} from '../vuex/actions'
    import {getFilters, getCompanies} from '../vuex/getters'

    export default{
        vuex: {
            actions: {
                fetchCompanies
            },
            getters: {
                getFilters,
                getCompanies
            }
        },
        props: ['categoryId'],
        data() {
            return {
                loading: true,
            }
        },
        methods: {
            loadCompanies(){
                this.loading = true
                console.log('... start request to api' + this.filter_params)
                this.fetchCompanies(this.filter_params).then((response) => {
                    this.loading = false
                })
            },
            emailModal(company_object){
                console.log('todo: make contact email modal')
            }

        },
        filters:{
            /**
             *
             * @param products  list of object
             * ex: {"AQUACULTURE":["Fresh Seafood","Live Catfish","Tilapia"],"LANDSCAPE PLANTS":["Palms","Water Lilies Barefoot"],"POTTED FLOWERING PLANTS":["Water Lilies Tropical Hardy"],"PROPAGATIVE MATERIAL":["Seeds","Palm-Pritchardiabeccariana"]}
             * Top Level Product: (Object) => [Array of Products]
             */
            format_category_products(category){
                var response = ''
                var key = typeof category

                return key
            },
            /**
             *
             * @param json_string
             *
             * need to format like:
             * [{category_name: 'MAIN CATEGORY', products: ['PRODUCT_NAME','PRODUCT_NAME']}]
             *
             */
            fix_json(json_string){
                var category_object = JSON.parse(json_string)
                var formatted = []

                if (typeof category_object === 'object'){
                    var keys = Object.keys(category_object)
                    if (keys.length){
                        keys.forEach((main_category) => {
                            var category_products = {
                                category_name: main_category,
                                relevant: true,
                                products: []
                            }
                            if (Array.isArray(category_object[main_category])){
                                category_object[main_category].forEach((product) => {
                                    category_products.products.push(product)

                                    // TODO: change api call to include real json data!!! having IDs would be super to filter relevant data
                                    /**
                                     *
                                     *
                                     *

                                     if (product.parent_id == this.$route.params.id){
                                       category_products.relevant = true
                                     }
                                     *
                                     *
                                     */



                                })
                            }
                            if (category_products.products.length>0){
                                formatted.push(category_products)
                            }
                        })
                    }
                }
                return formatted
            }
        },
        events:{
            filtersChanged(args){
                console.log('i heard you!')
                this.loadCompanies()

            }
        },
        computed: {
            category_name(){

            },
            listings() {
                return this.getCompanies
            },
            filter_params(){
                var qs = "?"
                var keys = Object.keys(this.getFilters)
                keys.forEach((key) => {

                    // -- special case, parse category objects to make a category filter
                    //TODO: add API feature so we don't have to make special cases - categories should be the variable on API
                    if (key == 'categories'){
                        var categories = this.getFilters[key]
                        var category_id_arr = []
                        categories.forEach((category_object) => {
                            category_id_arr.push(category_object.id)
                        })

                        if (category_id_arr.length <=0){
                            // -- include the category id from the route parameter if none are set!
                            category_id_arr.push(this.$route.params.id)
                        }

                        var category_ids = category_id_arr.join(',')
                        qs += 'category_id=' + category_ids + '&'
                    } else {
                        // -- default case (normalized)
                        if (this.getFilters[key]) {
                            qs += encodeURIComponent(key) + "=" + encodeURIComponent(this.getFilters[key]) + "&"
                        }
                    }
                })
                if (qs.length > 0) {
                    qs = qs.substring(0, qs.length - 1); //chop off last "&"
                }
                return qs
            }
        },
        ready() {

            this.loadCompanies()

        }
    }
</script>
