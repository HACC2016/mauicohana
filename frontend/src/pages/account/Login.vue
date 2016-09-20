<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>
        <main class="site-content large-12 columns" v-show="!loading" transition="slideLeft" transition-mode="out-in">
            <div class="page-content row">

                <div class="medium-8 medium-offset-2 columns card end offset-2">
                    <h1 class="text-headline">Login Form</h1>
                    <span class="text-caption">
                        Please provide your email address and password to login
                    </span>

                    <form @submit.prevent="login()">
                        <div class="row column">
                            <input type="text" id="input_1" class="with-floating-label" required=""
                                   v-model="credentials.email">
                            <label for="input_1" class="floating-label">Email</label>
                        </div>


                        <div class="row column">
                            <input type="password" id="password" class="with-floating-label" required=""
                                   v-model="credentials.password">
                            <label for="password" class="floating-label">Password</label>
                        </div>


                        <div class="row column" v-show="error" transition="bounceIn">
                            <div class="callout alert">
                                <h5>Could not login</h5>
                                <p>{{ error }}</p>
                            </div>
                        </div>

                        <div class="row column">
                            <button type="submit" class="raised-button ink">Log In <i v-show="processing"
                                                                                      class="fa fa-spinner fa-spin"></i>
                            </button>
                        </div>
                    </form>

                    <p>
                        <a class="flat-button bottom-button ink" v-link="{'path': '/account/password'}"
                           title="Forgot your password?">Forgot your password?</a>
                        <a class="flat-button bottom-button ink" v-link="{'path': '/account/signup'}" title="Register?">Register</a>
                    </p>
                </div>

            </div>
        </main>
    </div>
    <!--./template -->
</template>
<style>

</style>
<script>
    import {loginUser} from '../../vuex/actions'
    import {getUser} from '../../vuex/getters'
    export default {
        vuex: {
            actions: {
                loginUser
            },
            getters: {
                getUser
            }
        },
        data () {
            return {
                page_title: 'Login Form',
                loading: true,
                processing: false,
                error: null,
                credentials: {
                    email: null,
                    password: null,
                    rememberMe: false,
                }
            }
        },
        methods: {
            login() {

                this.processing = true
                this.error = null
                this.loginUser(this.credentials).then((response) => {
                    this.processing = false

                    if (response) {

                        if (response.hasOwnProperty('errors')) {
                            if (Array.isArray(response.errors)) {
                                if (response.errors.length > 0) {
                                    return this.error = response.errors[0]
                                }
                            }
                        }

                        return this.$router.go('/account')

                    } else {
                        this.processing = false
                        this.$router.go('/account')
                    }
                })

                return true

            },
        },
        ready(){
            this.loading = false
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
