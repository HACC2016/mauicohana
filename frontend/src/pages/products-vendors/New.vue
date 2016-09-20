<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>

        <h2 class="hidden">New Vendor</h2>

        <main class="site-content large-12 columns">
            <div class="page-content row">

                <div class="large-6 large-centered columns">
                    <div class="row">
                        <div class="large-12 columns">
                            <form>
                                <fieldset>
                                    <legend>Vendor Information</legend>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Business / Vendor Name</label>
                                            <input type="text" name="vendor_name" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Email Address</label>
                                            <input type="text" name="vendor_email" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Phone Number</label>
                                            <input type="text" name="vendor_phone" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Website</label>
                                            <input type="text" name="vendor_website" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Hawaii Business Registration Number</label>
                                            <input type="text" name="vendor_brn" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Products are&hellip;</label>
                                            <div class="callout">
                                                <label><input type="radio" name="vendor_qualification">100% Hawaii grown</label>
                                                <label><input type="radio" name="vendor_qualification">Value added products with at least 50% inputs from Hawaii</label>
                                                <label><input type="radio" name="vendor_qualification">All of the above</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Harmonized System Code</label>
                                            <input type="text" name="vendor_hscode" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Business / Vendor Description</label>
                                            <textarea name="vendor_description"></textarea>
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <legend>Product Information</legend>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>What products do you sell?</label>
                                            <input type="text" name="vendor_products" placeholder="replace with checkboxes?" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>How are products sold?</label>
                                            <div class="callout">
                                                <label><input type="checkbox" name="vendor_markets[]">Farmers&rsquo; Markets</label>
                                                <label><input type="checkbox" name="vendor_markets[]">Local Distribution / Wholesale</label>
                                                <label><input type="checkbox" name="vendor_markets[]">International Distribution</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Where (locally) are products sold?</label>
                                            <input type="text" name="vendor_locations" placeholder="replace with checkboxes?" />
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Agreement</label>
                                            <div class="callout">
                                                <label><input type="checkbox" name="vendor_confirmation[]">Click to indicate that all information entered here is true</label>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <input type="submit" class="raised-button" value="Add Vendor" />
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
