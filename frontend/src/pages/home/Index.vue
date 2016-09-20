<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>
        <main class="site-content">
            <div class="page-content">
                <div class=" row">
                    
                    <div class="large-4 columns relative">
                        <div class="vblock">
							<img src="/static/img/products.svg" alt="Location of business" class="home-icons" />
                            <h2>The products you need</h2>
                            <p><strong>400+</strong> agricultural vendors available to help you whether you are local, mainland or international!</p>
                            <p><a v-link="{'path': '/products-vendors'}" title="Products & Vendors" class="">Find Products or Vendors <i class="fa fa-angle-right" aria-hidden="true"></i></a><p>
                        </div>
                       
                    </div>
					<div class="large-4 columns relative">
                        <div class="vblock">
							<img src="/static/img/farmers-market.svg" alt="Location of business" class="home-icons" />
                            <h2>Enjoy Farmers&rsquo; Markets</h2>
                            <p>There are over 200 Farmers’ Markets statewide for you to visit.</p>
                            <p><a v-link="{'path': '/farmers-markets'}" title="Farmers' Markets" >Find one near you! <i class="fa fa-angle-right" aria-hidden="true"></i></a><p>
                        </div>
                       
					</div>
					<div class="large-4 columns relative">
                        <div class="vblock">
							<img src="/static/img/claim-business.svg" alt="Location of business" class="home-icons" />
                            <h2>Claim your business</h2>
                            <p>Sign up and add your business! If it is already listed create your account and claim it. </p>
                            <p><a v-link="{'path': '/account/login'}" title="Vendor Login" >Create an account <i class="fa fa-angle-right" aria-hidden="true"></i></a><p>
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
                page_title: 'Home',
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
