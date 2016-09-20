<template>
    <div id="site" class="site farmers-markets">

        <header-partial>

           <div slot="tagline">
               <h1 class="page-title">Farmers&rsquo; Markets</h1>
               <p>There are over 200 farmers&rsquo; markets throughout Hawaii.</p>
           </div>

           <div slot="search">
               <form method="get">
                   <div class="input-group">
                       <input class="input-group-field" type="search" name="search" />
                       <a href="#" class="input-group-button button"><i class="fa fa-search" aria-hidden="true"></i></a>
                   </div>
                   <p class="help-text">Search location, product or vendor</p>
               </form>
           </div>

        </header-partial>

        <div class="row" id="primary">
            <router-view></router-view>
        </div><!-- .row#primary -->

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
            HeaderPartial, FooterPartial
        }
    }
</script>
