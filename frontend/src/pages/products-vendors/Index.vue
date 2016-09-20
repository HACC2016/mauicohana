<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>



        <main class="site-content large-12 columns">
            <div class="page-content row">


                <div class="loading" v-show="loading" transition="fade">
                    <i class="fa fa-spinner fa-spin"></i>
                </div>

                <div class="medium-12 columns" transition="fade" v-show="!loading">
                   

                    <div class="text-center row column">

                        <div class="medium-3 large-3 columns card product-icons end" v-for="category in categories">
							 <a v-link="{path: '/products-vendors/listings/' + category.id }">
							<img src="/static/img/icons/{{category.id}}.svg" />
							<h4 class="text-headline">{{ category.name}}</h4>
							
                            <span class="text-caption">{{ category.children.length }} vendors</span>
                            <!--<p>
                                <a href="#" class="flat-button bottom-button ink"></a>
                                <a href="#" class="link-icon"><i class="icon icon-more-vert icon-hc-lg float-right"></i></a>
                            </p>-->
								 </a>
                        </div>

                        <!-- loop end -->


                    </div>

                </div>
            </div>
        </main>
    </div>
    <!--./template -->
</template>
<style>

</style>
<script>
    import {apiEndPoint} from '../../config'
    export default {

        data () {
            return {
                page_title: 'Products & Vendors',
                edge: '/categories',
                loading: true,
                categories: {}
            }
        },
        methods: {

            getCategories(){

                this.$http.get(apiEndPoint + this.edge).then((response) => {
                    if (response.data.data) {
                        this.categories = response.data.data
                        this.loading = false
                    }
                },(response) => {
                    console.log(response)
                    this.loading = false
                })
            }

        },
        computed: {	},
        ready(){
            this.getCategories()
        },
        // -- seo config for this page
        head: {
            title () {
                return {
                    inner: 'Hawaii Depart of Agriculture',
                    separator: '-',
                    complement: this.page_title
                }
            },
            meta: [
                {
                    name: 'description',
                    content: '...'
                },
            ]
        }
    }
</script>
