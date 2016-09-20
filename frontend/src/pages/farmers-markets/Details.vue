<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>

        <h2 class="hidden">Market Details</h2>

        <main class="site-content large-12 columns">
            <div class="page-content row">
                <aside class="medium-4 columns">
                    <div class="callout">
                        <h4>Vendors</h4>
                        <ul>
                            <li><a v-link="{'path': '/products-vendors/details'}" title="Maui Brewing Company">Maui Brewing Company</a></li>
                            <li><a v-link="{'path': '/products-vendors/details'}" title="Cohana">Cohana</a></li>
                            <li><a v-link="{'path': '/products-vendors/details'}" title="Oahu Organics">Oahu Organics</a></li>
                        </ul>
                    </div>
                    <div class="callout">
                        <h4>Organizer Information</h4>
                        <ul>
                            <li>First & Last Name</li>
                            <li>Website</li>
                        </ul>
                    </div>
                </aside>

                <article class="hentry type-entry details medium-8 columns">
                    <header class="entry-header">
                        <p><a class="inverse" v-link="{'path': '/farmers-markets'}" title="Back to Results"><small><i class="fa fa-chevron-left" aria-hidden="true"></i> Back to Results</small></a></p>
                        <h2 class="entry-title"><i class="fa fa-map-o" aria-hidden="true"></i> Paia Market</h2>
                        <p class="entry-date"><em>Wednesday & Fridays, 8am-4pm</em></p>
                    </header>
                    <div class="entry-content">
                        <hr />
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum praesentium officia, fugit recusandae ipsa, quia velit nulla adipisci? Consequuntur aspernatur at, eaque hic repellendus sit dicta consequatur quae, ut harum ipsam molestias maxime non nisi reiciendis eligendi! Doloremque quia pariatur harum ea amet quibusdam quisquam, quae, temporibus dolores porro doloribus.</p>
                    </div>
                    <div class="entry-footer">
                        <p class="entry-meta">605 Lipoa Pkwy, Kihei, HI 96753<span class="sep"> | </span><a class="inverse" href="#map" title="Show Map"><small><i class="fa fa-map-o" aria-hidden="true"></i> show map</small></a></p>
                        <hr />
                        <div>Are you the organizer?<span class="sep"> | </span><a href="#"><small><i class="fa fa-wrench" aria-hidden="true"></i> claim market</small></a><span class="sep"> | </span><a href="#"><small><i class="fa fa-wrench" aria-hidden="true"></i> edit market</small></a></div>
                    </div>
                </article>
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
