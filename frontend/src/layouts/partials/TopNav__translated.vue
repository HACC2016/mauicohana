<template>
    <div id="top_nav_container">
        <nav class="site-navigation desktop-navigation">
            <ul class="dropdown menu text-right" data-dropdown-menu>
                <li v-link-active><a class="ink" v-link="{path: '/products-vendors'}" title="{{ 'public.header.nav.products' | translate }}">{{'public.header.nav.products' | translate }} </a></li><!--
                --><li v-link-active><a class="ink" v-link="{path: '/events'}" title="{{ 'public.header.nav.events' | translate }}"><!-- <i class="icon icon-perm_contact_calendar"></i> -->{{ 'public.header.nav.events' | translate }}</a></li><!--
                --><li v-link-active><a class="ink" v-link="{path: '/farmers-markets'}" title="{{ 'public.header.nav.markets' | translate }}"><!-- <i class="icon icon-attach-money"></i> -->{{ 'public.header.nav.markets' | translate }}</a></li><!--
                --><li v-link-active><a class="ink" v-link="{path: '/faqs'}" title="{{ 'public.header.nav.faqs' | translate }}"><!-- <i class="icon icon-question"></i> -->{{ 'public.header.nav.faqs' | translate }}</a></li><!--
                --><li v-link-active><a class="ink" v-link="{path: '/hacc'}" title="{{ 'public.header.nav.hacc' | translate }}">{{ 'public.header.nav.hacc' | translate }}</a></li><!--
                --><!-- logged in --><!--
                --><li transition="slideDown" transition-mode="out-in" v-show="$auth.check()" v-link-active>
                    <a class="ink" href="#" title="{{ 'public.header.nav.account' | translate }}">{{'public.header.nav.account' | translate }}</a>
                --></li><!--
                --><!--- not logged in --><!--
                --><li transition="slideDown" transition-mode="out-in" v-show="!$auth.check()" v-link-active><a class="ink" v-link="{path: '/account/login'}" title="{{ 'public.header.nav.account.login' | translate }}">{{'public.header.nav.account.login' | translate }}</a></li><!--
                --><li transition="slideDown" transition-mode="out-in" v-show="!$auth.check()" v-link-active><a class="ink" v-link="{path: '/account/signup'}" title="{{ 'public.header.nav.account.signup' | translate }}">{{'public.header.nav.account.signup' | translate }}</a></li><!--
                --><!-- admin --><!--
                --><li v-show="$auth.check('admin')" v-link-active><a class="ink" href="#" title="{{ 'public.header.nav.admin' | translate }}">{{'public.header.nav.admin' | translate }}</a></li>
            </ul>
        </nav>
        <nav class="site-navigation mobile-navigation">
            <ul class="dropdown menu text-right" data-dropdown-menu>
                <li><a href="#">Menu</a>
                    <ul class="menu text-left">
                        <li v-link-active><a class="ink" v-link="{path: '/products-vendors'}" title="{{ 'public.header.nav.products' | translate }}">{{'public.header.nav.products' | translate }}</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/events'}" title="{{ 'public.header.nav.events' | translate }}">{{ 'public.header.nav.events' | translate }}</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/farmers-markets'}" title="{{ 'public.header.nav.markets' | translate }}">{{ 'public.header.nav.markets' | translate }}</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/faqs'}" title="{{ 'public.header.nav.events' | translate }}">{{ 'public.header.nav.events' | translate }}</a></li>
                        <li v-link-active><a class="ink" v-link="{path: '/hacc'}" title="{{ 'public.header.nav.hacc' | translate }}">{{ 'public.header.nav.hacc' | translate }}</a></li>
                        <li v-link-active><a class="ink" href="#" title="{{ 'public.header.nav.account' | translate }}">{{'public.header.nav.account' | translate }}</a>
                            <ul class="menu text-left">
                                <li><a v-link="{path: '/account'}" title="{{ 'public.header.nav.account.dashboard' | translate }}">{{ 'public.header.nav.account.dashboard' | translate }}</a></li>
                                <li><a v-link="{path: '/account/signup'}" title="{{ 'public.header.nav.account.logout' | translate }}">{{ 'public.header.nav.account.logout' | translate }}</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</template>
<script>
    export default{
        ready(){
            $(function(){
                $('#top_nav_container').foundation()
            })
        }
    }
</script>
