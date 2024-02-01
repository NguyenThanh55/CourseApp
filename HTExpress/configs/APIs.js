import axios from "axios";

export const endpoints = {
  login: "/o/token/",
  "current-user": "/user/current_user/",
  register: "/user/create_user/",
  "get-orders": "/order/",
  "all-order": "/order/",
};

export const authApi = (accessToken) =>
  axios.create({
    // baseURL: "http://192.168.1.79:8080",
    baseURL: "http://192.168.1.104:8000",
    headers: {
      Authorization: `Bearer ${accessToken}`,
    },
  });

export default axios.create({
  // baseURL: "http://192.168.1.79:8080",
  baseURL: "http://192.168.1.104:8000",
});
