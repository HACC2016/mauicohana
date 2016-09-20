<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>
        <main class="site-content large-12 columns">
            <div class="page-content row">

                <div class="medium-6 medium-offset-3 columns card end">

                    <h1 class="text-headline">Page Not Found</h1>
                    <span class="text-caption">
                        Oops!
                    </span>
                    <p class="text-body-1">
                        The requested page was not found.
                    </p>
                    <p><a v-link="{path: '/'}">Home</a>

                </div>

            </div>
        </main>
    </div>
    <!--./template -->
</template>
<style>

</style>
<script>
    export default {

        data () {
            return {
                page_title: 'Not Found',
            }
        },
        methods: {},
        computed: {},
        ready(){

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
