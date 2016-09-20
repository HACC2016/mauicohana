import Vue from 'vue'
import Vuex from 'vuex'
import {vueLocalizeVuexStoreModule} from 'vue-localize'


Vue.use(Vuex)

const state = {

  map_listing: {
    markers: [],
    loaded: false,
    bounds: {},
    center: {lat: 0, lng: 0},
    zoom: 7,
    options: {
      scrollwheel: false,
      maxZoom: 19,
      minZoom: 2,
    },
    grid_size: 20
  },

  selected_filters: {
    page: 1,
    sort: 'name',
    direction: 'asc',
    per_page: 25,
    exporter: null,
    island: null,
    service: null,
    name: null,
    categories: []
  },

  companies: [],
  categories: [],
  main_search: null,
  user: {
    companies: [],
    data: {},
    authenticated: false,
    admin: false
  }

}

const mutations = {

  MAP_LOADED (state, promise) {
    state.map_listing.loaded = promise
  },
  SET_MAP_MARKERS (state, val) {
    state.map_listing.markers = val
  },
  SET_MAP_BOUNDS (state, val){
    state.map_listing.bounds = val
  },
  UNSET_MAP_MARKERS (state) {
    state.map_listing.markers = []
  },
  SET_FILTER_KEY (state, filter_key, val){
    state.selected_filters[filter_key] = val
  },
  UNSET_FILTER_KEY (state, filter_key, val){
    state.selected_filters[filter_key] = val
  },
  UNSET_ALL_FILTERS (state){
    state.selected_filters = []
  },
  SET_COMPANIES (state, val){
    state.companies = val
  },
  SET_CATEGORIES (state, val){
    state.categories = val
  },
  SET_MAIN_SEARCH (state, val){
    state.main_search = val
  },
  TOGGLE_CATEGORY_FILTER (state, category_object, selected){
    if (selected) {
      state.selected_filters.categories.push(category_object)
    } else {
      state.selected_filters.categories.$remove(category_object)
    }
  },
  SET_AUTHENTICATED_USER(state, val){
    state.user = val
  },
  SET_USER_COMPANIES(state, val){
    state.user.companies = val
  },
  LOGOUT_USER(state){
    state.user = {
      companies: [],
      data: {},
      authenticated: false,
      admin: false
    }
  }

}

export default new Vuex.Store({
  state,
  mutations,
  modules: {
    vueLocalizeVuexStoreModule
  }
})
