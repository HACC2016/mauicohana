<template>


    <div class="medium-6 large-4 columns">

        <div class="loading" v-show="loading">
            <i class="fa fa-spinner fa-spin"></i>
        </div>
		<h2>Filter items</h2>
        <div class="filter-menu" v-show="!loading" transition="rotateUpLeft">
            <ul class="vertical accordion-menu menu" data-accordion-menu>
                <li v-for="category in getCategories.data">
                    <a href="#">{{ category.name }}</a>
                    <ul class="menu vertical sublevel-1" v-if="category.hasOwnProperty(children)">
                        <li v-for="child in category.children">
                            <a class="subitem" href="#">{{ child.name }}</a>
                            <ul class="menu vertical sublevel-2" v-if="child.hasOwnProperty(children)">
                                <li v-for="product in child.children">
                                    <a class="subitem" href="#">{{ product.name }}</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

</template>

<script>
    import {setFilterKey, unsetFilterKey, unsetAllFilters, setMainSearch, fetchCategories} from '../vuex/actions'
    import {getFilters, getMainSearch, getCategories} from '../vuex/getters'

    export default{
        vuex: {
            actions: {
                fetchCategories
            },
            getters: {
                getFilters, getMainSearch, getCategories
            }
        },
        props: ['categoryId'],
        data() {
            return {
                loading: true,
            }
        },
        ready() {
            console.log('... start request to api')
            this.fetchCategories(this.categoryId).then((response) => {
                this.loading = false
                console.log(response)
                this.$nextTick(() => {
                    $('.filter-menu').foundation()
                })
            })
        }
    }
</script>
