<template>


    <div class="medium-6 large-4 columns">

        <div class="loading" v-show="loading">
            <i class="fa fa-spinner fa-spin"></i>
        </div>

        <div class="filter-menu" v-show="!loading" transition="bounceLeft">
            <ul class="vertical accordion-menu menu" data-accordion-menu id="category_accordion">
                <li><input type="text" v-model="category_search" placeholder="quick category search ...." /></li>
                <category-item
                    v-for="category in categories"
                    :category=category
                    :sublevel="1"
                    transition="bounceLeft"
                    :stagger="10"
                ></category-item>
            </ul>

        </div>
    </div>

</template>

<script>
    import {setFilterKey, unsetFilterKey, unsetAllFilters, setMainSearch, fetchCategories} from '../vuex/actions'
    import {getFilters, getMainSearch, getCategories} from '../vuex/getters'
    import CategoryItem from './CategoryItem'

    export default{
        vuex: {
            actions: {
                fetchCategories, setFilterKey
            },
            getters: {
                getFilters,
                getMainSearch,
                categories: getCategories
            }
        },
        props: ['categoryId'],
        data() {
            return {
                loading: true,
                category_search: null
            }
        },
        components: {
          CategoryItem
        },
        computed:{
            is_expanded(){
                return (this.$route.params.id == this.categoryId)
            }
        },
        ready() {
            console.log('... start request to api')
            this.fetchCategories(this.categoryId).then((response) => {
                this.loading = false
                $(function(){
                    var elem = new Foundation.AccordionMenu($('#category_accordion'), {});
                })
            })
        }
    }
</script>
