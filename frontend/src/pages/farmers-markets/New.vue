<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>

        <h2 class="hidden">New Farmers&rsquo; Market</h2>

        <main class="site-content large-12 columns">
            <div class="page-content row">

                <div class="large-6 large-centered columns">
                    <div class="row">
                        <div class="large-12 columns">
                            <form>
                                <fieldset>
                                    <legend>Organizer Information</legend>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>First & Last Name</label>
                                            <input type="text" name="organizer_name" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Email Address</label>
                                            <input type="text" name="organizer_email" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Phone Number</label>
                                            <input type="text" name="organizer_phone" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Website</label>
                                            <input type="text" name="organizer_website" />
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <legend>Market Information</legend>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Farmers&rsquo; Market Name</label>
                                            <input type="text" name="market_name" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market Description</label>
                                            <textarea name="market_description"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market Dates</label>
                                            <div class="callout">
                                                <label><input type="checkbox" name="markets_dates[]">Mondays</label>
                                                <label><input type="checkbox" name="markets_dates[]">Tuesdays</label>
                                                <label><input type="checkbox" name="markets_dates[]">Wednesdays</label>
                                                <label><input type="checkbox" name="markets_dates[]">Thursdays</label>
                                                <label><input type="checkbox" name="markets_dates[]">Fridays</label>
                                                <label><input type="checkbox" name="markets_dates[]">Saturdays</label>
                                                <label><input type="checkbox" name="markets_dates[]">Sundays</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market Start Time</label>
                                            <input type="text" name="market_start_time" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market End Time</label>
                                            <input type="text" name="market_end_time" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market Island</label>
                                            <input type="text" name="market_island" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market Street Address</label>
                                            <input type="text" name="market_street" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market City</label>
                                            <input type="text" name="market_city" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market Zip Code</label>
                                            <input type="text" name="market_zip" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Market Website</label>
                                            <textarea name="market_website"></textarea>
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <legend>Vendor Information</legend>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>List all participating vendors</label>
                                            <input type="text" name="vendors" placeholder="replace with checkboxes?" />
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <input type="submit" class="raised-button" value="Add Farmer&rsquo; Market" />
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
