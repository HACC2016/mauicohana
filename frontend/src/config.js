const apiEndPoint = 'https://hacc-maui-api.herokuapp.com/api/v1'

const LOGIN_ENDPOINT = {url: apiEndPoint + '/auth/sign_in', method: 'post'}
const SIGNUP_ENDPOINT = {url: apiEndPoint + '/auth', method: 'post'}
const USER_ENDPOINT = {url: apiEndPoint + '/users/', method: 'get'}
const localStorage = window.localStorage

export {
    apiEndPoint, LOGIN_ENDPOINT, SIGNUP_ENDPOINT, USER_ENDPOINT, localStorage
}
