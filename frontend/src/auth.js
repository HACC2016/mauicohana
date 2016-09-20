const API_URL = 'https://hacc-maui-api.herokuapp.com/api/v1'
// const API_URL = 'http://localhost:3003/api/v1'
const LOGIN_ENDPOINT = {url: API_URL + '/auth/sign_in', method: 'post'}
const SIGNUP_ENDPOINT = {url: API_URL + '/auth', method: 'post'}
const USER_ENDPOINT = {url: API_URL + '/users/', method: 'get'}
const localStorage = window.localStorage

export default {

  api_auth_headers: [
    'access-token', 'token-type', 'uid', 'client'
  ],
  logout () {
    localStorage.removeItem('client')
    localStorage.removeItem('expiry')
    localStorage.removeItem('access-token')
    localStorage.removeItem('token-type')
    localStorage.removeItem('uid')
  },
  storeLocalKey(key, value){
    localStorage.setItem(key, value)
    console.log('... key stored [' + key + ': ' + value + ']')
  },
  storeHeader(headers){
    this.api_auth_headers.forEach((key) => {
      var value = headers.get(key)
      if (typeof value !== 'undefined' && value !== null) {
        this.storeLocalKey(key, value)
      }
    })
  },
  getAuthHeader () {
    return {
      'access-token': localStorage.getItem('access-token'),
      'token-type': localStorage.getItem('token-type'),
      'uid': localStorage.getItem('uid'),
      'client': localStorage.getItem('client')
    }
  }
}
