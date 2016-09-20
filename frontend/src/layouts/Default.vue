<template>
    <div id="site" class="site home">

        <header-partial>

           <div slot="tagline">
               <h1 class="page-title hidden">Made in Hawaii</h1>
               <div class="row">
                  <div class="large-4 large-centered columns">
                      <div class="row">
                          <div class="large-12 columns">
                               <p><img src="/static/img/made-in-hawaii.svg" alt="Made in Hawaii" class="fluid" /></p>
                          </div>
                      </div>
                  </div>
               </div>
               <p>Help grow Hawaii&rsquo;s agriculture food and products industry.</p>
               <p><a v-link="{'path': '/products-vendors'}" title="Products & Vendors" class="raised-button">Search Products & Vendors <i class="fa fa-angle-right" aria-hidden="true"></i></a><p>
           </div>

        </header-partial>

        <div id="primary">
            <router-view></router-view>
        </div><!-- #primary -->

        <footer-partial></footer-partial>

    </div>
</template>
<style>

</style>
<script>
    import HeaderPartial from './partials/HeaderPartial'
    import FooterPartial from './partials/FooterPartial'

    export default{
        data(){
            return{

            }
        },
        components:{
            FooterPartial, HeaderPartial
        }
    }
</script>
