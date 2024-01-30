import axios from "axios";

export const endpoints = {
    'login': '/o/token/',
    'current-user': '/users/current-user/',
    'register': '/users/',
    'get-users': '/user/'
   
}

export const authApi = (accessToken) => axios.create({
    baseURL: "http://192.168.1.79:8080",
    headers: {
        "Authorization": `bearer ${accessToken}`
    }
})

export default axios.create({
    baseURL: "http://192.168.1.79:8080"
})