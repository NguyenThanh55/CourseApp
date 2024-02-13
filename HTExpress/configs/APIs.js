import axios from "axios";

export const endpoints = {
  login: "/o/token/",
  "current-user": "/user/current_user/",
  register: "/user/create_user/",

  "all-order-for-shipper": "/order/no_shipper/",
  "my-order": "/user/my_orders/",
};

export const authApi = (accessToken) =>
  axios.create({
    baseURL: "http://192.168.1.14:8000",
    //baseURL: "http://192.168.0.9:8000",
    headers: {
      Authorization: `Bearer ${accessToken}`,
    },
  });

export default axios.create({
  baseURL: "http://192.168.1.14:8000",
  // baseURL: "http://192.168.0.9:8000",
});
