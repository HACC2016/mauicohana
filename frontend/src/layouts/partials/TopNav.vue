<template>
    <div id="top_nav_container">
        <nav class="site-navigation desktop-navigation">
            <ul class="dropdown menu text-right" data-dropdown-menu>
                <li v-link-active><a class="ink" v-link="{path: '/products-vendors'}" title="Find Products">Find
                    Products</a></li><!--
                -->
                <li v-link-active><a class="ink" v-link="{path: '/events'}" title="Events">Events</a></li><!--
                -->
                <li v-link-active><a class="ink" v-link="{path: '/farmers-markets'}" title="Farmers Markets">Farmers
                    Markets</a></li><!--
                -->
                <li v-link-active><a class="ink" v-link="{path: '/faqs'}" title="FAQs">FAQs</a></li><!--
                -->
                <li v-link-active><a class="ink" v-link="{path: '/hacc'}" title="HACC">HACC</a></li><!--
                --><!-- logged in --><!--
                -->
                <li v-link-active v-show="getUser.authenticated" transition="fade"><a class="ink" href="#" title="Account">Account</a>
                    <ul class="menu text-left">
                        <li><a v-link="{path: '/account/'}" title="Login">My Account</a></li>
                        <li><a v-link="{path: '/account/'}" title="Login">My Companies</a></li>
                        <li><a v-link="{path: '/account/'}" title="Login">My Contacts</a></li>
                        <li><a href="#" @click.prevent="logout" title="Log Out">Log Out</a></li>
                    </ul>
                </li><!--
                -->
                <!--- not logged in --><!--
                -->
                <li v-show="!getUser.authenticated" v-link-active transition="fade"><a class="ink" v-link="{path: '/account/login'}" title="Login">Login</a>
                </li><!--
                -->
                <li v-show="!getUser.authenticated" v-link-active transition="fade"><a class="ink" v-link="{path: '/account/signup'}" title="Sign Up">Sign Up</a></li><!--
                --><!-- admin --><!--
                -->
                <li v-show="getUser.admin && getUser.authenticated" v-link-active transition="fade"><a class="ink" href="#" title="Admin">Admin</a></li>
            </ul>
        </nav>
        <nav class="site-navigation mobile-navigation">
            <ul class="dropdown menu text-right" data-dropdown-menu>
                <li><a href="#">Menu</a>
                    <ul class="menu text-left">
                        <li v-link-active><a class="ink" v-link="{path: '/products-vendors'}" title="Find Products">Find
                            Products</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/events'}" title="Events">Events</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/farmers-markets'}" title="Farmers Markets">Farmers
                            Markets</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/faqs'}" title="FAQs">FAQs</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/hacc'}" title="HACC">HACC</a></li>
                        <li v-link-active><a class="ink" href="#" title="Account">Account</a>
                            <ul class="menu text-left">
                                <li><a v-link="{path: '/account/login'}" title="Login">Login</a></li>
                                <li><a v-link="{path: '/account/signup'}" title="Sign Up">Sign Up</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</template>
<script>
    import {getUser} from '../../vuex/getters'
    import {logoutUser} from '../../vuex/actions'
    export default{
        vuex: {
          getters:{
              getUser
          },
            actions: {
                logoutUser
            }
        },
        methods:{
            logout(){
                this.logoutUser()
                this.$root.$dispatch('AUTHENTICATE', false)
            }
        },
        events:{
            AUTHENTICATE(bool){
                console.log('event fired: authenticate' + bool)
            }
        },
        computed: {
            loggedIn(){
                return getUser.authenticated
            },
            isAdmin(){
                return getUser.admin
            }

        },
        ready(){
            $(function () {
                $('#top_nav_container').foundation()
            })
        }
    }
</script>
