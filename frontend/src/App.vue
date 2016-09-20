<template>
    <div id="wrapper" v-cloak>



        <header id="masthead" class="site-header">
            <div class="site-navigation row">
                <div class="large-12 columns">
                    <div class="relative">
                        <h2 class="site-branding">
                            <a v-link="{path: '/'}" rel="home" class="site-title block clearfix" title="Home">
                                <img src="/static/img/logo_alpha.png" alt="State of Hawaii - Department of Agriculture" />
                                <span><strong>State of Hawaii</strong> Department of Agriculture</span>
                            </a>
                        </h2>
                        <top-nav></top-nav>
                    </div>
                </div>
            </div>
        </header>



        <router-view></router-view>
    </div>
</template>

<script>
    import store from './vuex/store'
    import {reAuthenticate} from './vuex/actions'
    import {getUser} from './vuex/getters'
    import {auth} from './auth'
    import TopNav from './layouts/partials/TopNav'
    export default {
        store,
        auth,
        vuex: {
            actions: { reAuthenticate },
            getters: { getUser }
        },
        data () {
            return {

            }
        },
        components: {
            TopNav
        },
        methods: {

        },
        ready() {
            if (!getUser.id){
                this.reAuthenticate()
            }
        },
    }

</script>