import axios from "axios";

export const endpoints = {
  login: "/o/token/",
  "current-user": "/user/current-user/",
  register: "/user/create-user/",
  "all-order-for-shipper": "/order/no-shipper/",
  "my-order": "/user/my-orders/",
  "create-order": "/order/create-order/",
  ward: "/ward/",
  voucher: "/voucher/",

  bills: (userId) => `/user/${userId}/bill/`,
  ratings: (userId) => `/user/${userId}/ratings/`,
  "rating-shipper": (userId) => `/user/${userId}/rating-shipper/`,
};

export const authApi = (accessToken) =>
  axios.create({
    //  baseURL: "http://192.168.1.79:8080",
    baseURL: "http://192.168.1.103:8000",
    headers: {
      Authorization: `Bearer ${accessToken}`,
    },
  });
export default axios.create({
  //  baseURL: "http://192.168.1.79:8080",
  baseURL: "http://192.168.1.103:8000",
});
