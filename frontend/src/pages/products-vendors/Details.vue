<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>

        <h2 class="hidden">Vendor Details</h2>

        <main class="site-content large-12 columns">
            <div class="page-content row">
                <aside class="medium-4 columns">
                    <div class="callout">
                        <h4>Product Information</h4>
                        <ul>
                            <li>Product</li>
                            <li>Product</li>
                            <li>Product</li>
                        </ul>
                    </div>
                    <div class="callout">
                        <h4>Vendor Information</h4>
                        <ul>
                            <li>Distributor</li>
                            <li>Retailer</li>
                            <li>Food Service</li>
                            <li>Food Certified Organic</li>
                        </ul>
                    </div>
                </aside>

                <article class="hentry type-entry details medium-8 columns">
                    <header class="entry-header">
                        <p><a class="inverse" v-link="{'path': '/products-vendors/listings'}" title="Back to Results"><small><i class="fa fa-chevron-left" aria-hidden="true"></i> Back to Results</small></a></p>
                        <h2 class="entry-title"><i class="fa fa-leaf" aria-hidden="true"></i> Aloun Farms, Inc.</h2>
                        <div class="entry-meta">
                            <div>605 Lipoa Pkwy, Kihei, HI 96753 (Maui)<span class="sep"> | </span><a class="inverse" href="#map" title="Show Map"><small><i class="fa fa-map-o" aria-hidden="true"></i> show map</small></a></div>
                            <div>(808) 213-3002</div>
                            <p><em>info@mauibrewing.com</em></p>
                        </div>
                    </header>
                    <div class="entry-content">
                        <hr />
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum praesentium officia, fugit recusandae ipsa, quia velit nulla adipisci? Consequuntur aspernatur at, eaque hic repellendus sit dicta consequatur quae, ut harum ipsam molestias maxime non nisi reiciendis eligendi! Doloremque quia pariatur harum ea amet quibusdam quisquam, quae, temporibus dolores porro doloribus.</p>
                    </div>
                    <div class="entry-footer">
                        <hr />
                        <div>Are you the owner?<span class="sep"> | </span><a href="#"><small><i class="fa fa-wrench" aria-hidden="true"></i> claim listing</small></a><span class="sep"> | </span><a href="#"><small><i class="fa fa-wrench" aria-hidden="true"></i> edit listing</small></a></div>
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
