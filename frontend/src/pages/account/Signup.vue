<template>
    <!-- must be wrapped in div to avoid fragments -->
    <!---
    https://icebob.gitbooks.io/vueformgenerator/content/
    --->
    <div>

        <h2 class="hidden">Account Signup</h2>

        <main class="site-content large-12 columns">
            <div class="page-content row">

                <div class="medium-12 columns card end">
                    <h1 class="text-headline">Register New Account</h1>
                    <span class="text-caption">
                        Please fill in the following information to register as a user for the site. <br>
                        Once you are registered, you can manage your companies and products from within the 'My Account' menu
                    </span>

                    <form @submit.prevent="register()">
                        <div class="row column">
                            <input type="text" id="email" class="with-floating-label" required="" v-model="form.email">
                            <label for="email" class="floating-label">Email</label>
                        </div>

                        <div class="row column">
                            <input type="password" id="password" class="with-floating-label" required=""
                                   v-model="form.password">
                            <label for="password" class="floating-label">Password</label>
                        </div>

                        <div class="row column">
                            <input type="password" id="password_confirmation" class="with-floating-label" required=""
                                   v-model="form.password_confirmation">
                            <label for="password_confirmation" class="floating-label">Re-type Password</label>
                        </div>

                        <div class="row column" v-show="error" transition="bounceIn">
                            <div class="callout alert">
                                <h5>Registration Error</h5>
                                <p>{{ error }}</p>
                            </div>
                        </div>

                        <div class="row column">
                            <button type="submit" class="raised-button ink">Register <i v-show="processing"
                                                                                        class="fa fa-spinner fa-spin"></i>
                            </button>
                        </div>
                    </form>

                    <p>
                        <a class="flat-button bottom-button ink" v-link="{'path': '/account/login'}"
                           title="Forgot your password?">Already Registered? Login Here</a>
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
    import auth from '../../auth'
    export default {

        data () {
            return {
                page_title: 'Registration',
                loading: true,
                processing: false,
                error: null,
                form: {
                    email: null,
                    password: null,
                    password_confirmation: null,
                    confirm_success_url: '/account'
                },
            }
        },
        methods: {
            register() {

                this.processing = true
                this.error = null

                auth.signup(this, this.form, (response) => {

                    this.processing = false

                    if (response.errors.full_messages[0]){
                        return this.error = response.errors.full_messages[0]
                    }


                    if (response) {

                        if (response.hasOwnProperty('errors')) {
                            if (Array.isArray(response.errors)) {
                                if (response.errors.length > 0) {
                                    return this.error = response.errors[0]
                                }
                            }
                        }
                        if (response.status == 'error') {
                            if (Array.isArray(response.errors)) {
                                if (response.errors.full_messages) {
                                    return this.error = response.errors.full_messages[0]
                                }
                            }

                        }


                        //return this.$router.go('/account')
                        console.log('successful registration')


                    } else {

                        this.error = 'Could not register at this time'

                    }

                })

            },
        }
        ,
        computed: {}
        ,
        ready()
        {
            this.loading = false
        }
        ,
        // -- seo config for this page
        head: {
            title()
            {
                return {
                    inner: 'Hawaii Depart of Agriculture',
                    separator: '-',
                    complement: this.page_title
                }
            }
            ,
            meta: [
                {
                    name: 'description',
                    content: '...'
                },
            ]
        }
    }
</script>
