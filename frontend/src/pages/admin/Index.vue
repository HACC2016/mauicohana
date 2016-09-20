<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>
        <main class="site-content large-12 columns">
            <div class="page-content">

                <div class="row">

                    <div class="medium-6 columns">

                        <form>

                            <fieldset>
                                <legend>Products</legend>
                            </fieldset>

                        </form>

                    </div>

                    <div class="medium-6 columns">

                        <form>

                            <fieldset>
                                <legend>Vendors</legend>
                            </fieldset>

                        </form>

                    </div>

                </div>

                <hr />

                <div class="row">

                    <div class="medium-6 columns">

                        <form>

                            <fieldset>
                                <legend>Farmers&rsquo; Markers</legend>
                            </fieldset>

                        </form>

                    </div>

                    <div class="medium-6 columns">

                        <form>

                            <fieldset>
                                <legend>Events</legend>
                            </fieldset>

                        </form>

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
    export default {

        data () {
            return {
                page_title: 'Page Name',
            }
        },
        methods: {

        },
        computed: {

        },
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
