<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>
        <main class="site-content large-12 columns">
            <div class="page-content row">

                <category-menu
                    :category-id=$route.params.id
                ></category-menu>

                <!---- LISTING ---->

                <div class="medium-6 small-12 large-8 columns">

                    <!-- loop start -->
                    <company-list
                        :category-id=$route.params.id>
                    </company-list>
                    <!-- loop end -->

                </div>
            </div>
        </main>
    </div>
    <!--./template -->
</template>
<script>
    import CategoryMenu from '../../components/CategoryMenu'
    import CompanyList from '../../components/CompanyList'
    import {getCategories} from '../../vuex/getters'

    export default {

        data () {
            return {
                page_title: 'Product Listings',
            }
        },
        components: {
            CategoryMenu,
            CompanyList
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
