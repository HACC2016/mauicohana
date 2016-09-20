export const setMapMarkers = makeAction('SET_MAP_MARKERS')
export const unsetMapMarkers = makeAction('UNSET_MAP_MARKERS')
export const setFilterKey = makeAction('SET_FILTER_KEY')
export const unsetFilterKey = makeAction('UNSET_FILTER_KEY')
export const unsetAllFilters = makeAction('UNSET_ALL_FILTERS')
export const setCompanies = makeAction('SET_COMPANIES')
export const setCategories = makeAction('SET_CATEGORIES')
export const setMainSearch = makeAction('SET_MAIN_SEARCH')
export const mapLoaded = makeAction('MAP_LOADED')
export const setMapBounds = makeAction('SET_BOUNDS')
export const toggleCategoryFilter = makeAction('TOGGLE_CATEGORY_FILTER')
export const logoutUser = makeAction('LOGOUT_USER')
import {apiEndPoint, LOGIN_ENDPOINT, SIGNUP_ENDPOINT} from '../config'

function makeAction (type) {
    return ({ dispatch }, ...args) => dispatch(type, ...args)
}

export function filtersChanged({dispatch}) {
    console.log('filters changes...')
}

export function fetchCategories({dispatch}, category_id) {

    let resource = apiEndPoint + '/categories'
    if (category_id){
        resource += '/' + category_id
    }

    return new Promise((resolve, reject) => {

        this.$http.get(resource).then((response) => {

            if (response.hasOwnProperty('data')){
                if (response.data.hasOwnProperty('data')){
                    if (Array.isArray(response.data.data)){
                        dispatch("SET_CATEGORIES", response.data.data)
                    } else {
                        if (typeof response.data.data == 'object'){
                            dispatch("SET_CATEGORIES", [response.data.data])
                        }
                    }
                }
            }


            resolve(response)

        }, (response) => {
            console.log('fetch categories error...')
            console.log(response)
            reject(response)
        })

    })
}

export function fetchCompanies({dispatch}, filters_query_string) {

    let resource = apiEndPoint + '/companies' + filters_query_string

    return new Promise((resolve, reject) => {

        this.$http.get(resource).then((response) => {
            console.log('fetch companies success...')
            dispatch("SET_COMPANIES", response.data)
            resolve(response)
        }, (response) => {
            console.log('fetch companies error...')
            console.log(response)
            reject(response)
        })

    })
}

export function fetchUserCompanies({dispatch}, user_id) {

    let resource = apiEndPoint + '/users/' + user_id

    return new Promise((resolve, reject) => {

        this.$http.get(resource).then((response) => {
            console.log('fetch companies success...')
            dispatch("SET_USER_COMPANIES", response.data)
            resolve(response)
        }, (response) => {
            console.log('fetch companies error...')
            console.log(response)
            reject(response)
        })

    })
}

export function reAuthenticate({dispatch}) {
    let resource = apiEndPoint + '/users/me'

    return new Promise((resolve, reject) => {
        this.$http.get(resource).then((response) => {

        console.log(response)

        if (response.status === 200) {
            console.log('login user success...')
            if (response.data.data.id) {
                let store_user = {
                    companies: [],
                    data: response.data.data,
                    authenticated: true,
                    admin: response.data.data.admin
                }
                dispatch("SET_AUTHENTICATED_USER", store_user)
            }
        }
        resolve(response)

    }, (response) => {
        resolve(response.data)
    })

    })
}

export function loginUser({dispatch}, credentials) {

    let resource = apiEndPoint + '/auth/sign_in'

    return new Promise((resolve, reject) => {

        this.$http.post(resource, credentials).then((response) => {

            if (response.status === 200) {
                console.log('login user success...')
                if (response.data.data.id) {
                    let store_user = {
                        companies: [],
                        data: response.data.data,
                        authenticated: true,
                        admin: response.data.data.admin
                    }
                    dispatch("SET_AUTHENTICATED_USER", store_user)
                }
            }

            resolve(response)

        }, (response) => {

            console.log('login user error...')
            console.log(response.data)
            resolve(response.data)

        })

    })
}
