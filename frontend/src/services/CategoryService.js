import Vue from 'vue'
import {apiEndPoint} from '../config'
const edge = '/categories'
const resource_url = apiEndPoint + edge

export default {
    fetchCategories(success, error) {
        Vue.http.get(resource_url).then(
            (response) => {
                success(response.data)
            },
            (response) => {
                error(response)
            }
        )
    },
}