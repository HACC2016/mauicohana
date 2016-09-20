<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>

        <h2 class="hidden">New Event</h2>

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
                                    <legend>Event Information</legend>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Name</label>
                                            <input type="text" name="event_name" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Date</label>
                                            <input type="text" name="event_date" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Start Time</label>
                                            <input type="text" name="event_start_time" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event End Time</label>
                                            <input type="text" name="event_end_time" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Island</label>
                                            <input type="text" name="event_island" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Venue</label>
                                            <input type="text" name="event_venue" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Street Address</label>
                                            <input type="text" name="event_street" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event City</label>
                                            <input type="text" name="event_city" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Zip Code</label>
                                            <input type="text" name="event_zip" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <label>Event Description</label>
                                            <textarea name="event_description"></textarea>
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
                                            <input type="submit" class="raised-button" value="Add Event" />
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
