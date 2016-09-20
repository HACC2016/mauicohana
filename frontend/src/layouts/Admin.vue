<template>
    <div id="site" class="site admin">

        <header-partial>

           <div slot="tagline">
               <h1 class="page-title">Admin Dashboard</h1>
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
