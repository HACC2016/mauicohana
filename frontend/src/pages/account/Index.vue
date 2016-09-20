<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>
        <main class="site-content large-12 columns">
            <div class="page-content row">

                <div class="medium-7 large-7 columns">

                    <h1 class="text-headline">My Companies</h1>
                    <p class="text-caption">
                        <a v-link="{path: '/products-vendors/new'}"><i class="fa fa-plus"></i> add new company</a>
                    </p>

                    <div class="companies_container">

                        <div class="loading" v-show="loading_companies" transition="fade">
                            <i class="fa fa-spinner fa-spin"></i>
                        </div>

                        <div class="medium-11 large-11 columns card end" v-show="!loading_companies" transition="fade">
                            <h1 class="text-headline">My Companies</h1>
                            <span class="text-caption">
                              November 10
                            </span>
                            <p class="text-body-1">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua.
                            </p>
                            <p>
                                <a href="#" class="flat-button bottom-button"><i class="fa fa-pencil"></i> edit</a>
                                <a href="#" class="flat-button bottom-button"><i class="fa fa-search"></i> view</a>
                                <a href="#" class="link-icon"><i class="icon icon-more-vert icon-hc-lg float-right"></i></a>
                            </p>
                        </div>

                    </div>
                </div>


                <div class="medium-5 large-5 columns">

                        <form>

                            <fieldset>
                                <legend>Account Information</legend>
                                <div class="row">
                                    <div class="large-12 columns">
                                        <label>Username</label>
                                        <input type="text" name="username"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="large-12 columns">
                                        <label>Email Address</label>
                                        <input type="text" name="email"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="large-12 columns">
                                        <input type="submit" class="raised-button" value="Save Changes"/>
                                    </div>
                                </div>
                            </fieldset>

                            <hr/>

                            <fieldset>
                                <legend>Change Password</legend>
                                <div class="row">
                                    <div class="large-12 columns">
                                        <label>Create New Password</label>
                                        <input type="password" name="vendor_password"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="large-12 columns">
                                        <label>Confirm New Password</label>
                                        <input type="password" name="vendor_password_confirm"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="large-12 columns">
                                        <input type="submit" class="raised-button" value="Change Password"/>
                                    </div>
                                </div>
                            </fieldset>

                        </form>

                    </div>

            </div>
        </main>
    </div>
    <!--./template -->
</template>
<style>

</style>
<script>
    import {fetchUserCompanies} from '../../vuex/actions'
    import {getUser} from '../../vuex/getters'
    import auth from '../../auth'
    export default {
        vuex: {
            actions: {
                fetchUserCompanies
            },
            getters: {
                getUser
            }
        },

        data () {
            return {
                page_title: 'Page Name',
                loading_companies: true,
            }
        },
        methods: {
            loadCompanies(){
                this.loading_companies = true
                console.log('... start request to api')
                this.fetchUserCompanies(this.getUser.data.id).then((response) => {
                    this.loading_companies = false
                    console.log('... api response')
                    console.log(response)
                })
            }
        },
        computed: {},
        ready(){
            this.loadCompanies()
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
