import "./assets/sass/app.scss"
import Vue from 'vue'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import VueHead from 'vue-head'
import VueResource from 'vue-resource'
import App from './App.vue'
import routes from './routes'
import auth from './auth'

Vue.use(Vuex)
Vue.use(VueRouter)
Vue.use(VueHead)
Vue.use(VueResource)

//Vue.http.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('id_token');
//Vue.http.options.root = apiEndPoint;

if (process.env.NODE_ENV !== 'production') {
    Vue.config.devtools = true
    Vue.config.debug = true
    //Vue.http.options.emulateJSON = true
    //Vue.http.options.emulateHTTP = true
}

Vue.router = new VueRouter({
    hashbang: true,
    history: true,
    linkActiveClass: 'active',
    mode: 'html5'
})



// -- API SPECIFIC HEADER INTERCEPTS
Vue.http.interceptors.push((request, next)  => {



    // modify request
    request.credentials = true
    const api_headers = auth.getAuthHeader()
    const header_keys = Object.keys(api_headers)
    header_keys.forEach((key) => {
        if (api_headers[key]) {
            if (api_headers[key] !== null) {
                request.headers[key] = api_headers[key]
                console.log('injected header key: ' + key + ': ' + api_headers[key])
                console.log('key is: ' + request.headers[key])

                Vue.http.headers.common[key] = api_headers[key]

            }
        }
    })

    // continue to next interceptor
    next((response) => {

        // modify response
        auth.storeHeader(response.headers)

    });
});

/* TODO: translate localization

import vueLocalizeConf from './i81n/config'
import VueLocalize from 'vue-localize'
Vue.use(VueLocalize, {
    store,
    config: vueLocalizeConf,
    router: Vue.router,
    routes: routes
})

*/

window.$ = window.jQuery = require('jquery')
require('./assets/js/switches')
require('../node_modules/foundation-sites/dist/foundation.min')
require('./assets/js/what-input')
require('./assets/js/ripple')
Vue.router.map(routes)
Vue.router.start(App, '#routerapp')

Vue.router.beforeEach(transition => {
    console.log('...before')
    if (!Vue.router.app.getUser.authenticated){
        Vue.router.app.reAuthenticate()
    }
    transition.next()
})







