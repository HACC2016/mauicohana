<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>
        <main class="site-content large-12 columns">
           <div class="page-content row">

                <div class="large-4 large-centered columns">
                    <div class="row">
                        <div class="large-12 columns">
                            <h2 class="page-title-secondary">Send Email</h2>
                            <form>
                                <fieldset>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Username or Email</label>
                                            <input type="text" name="username" />
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <input type="submit" class="raised-button" value="Reset Password" />
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
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
                page_title: 'Reset Password',
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
