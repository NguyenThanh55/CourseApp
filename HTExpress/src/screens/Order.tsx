import {View, Text, StyleSheet} from 'react-native';
import React, { useEffect, useState } from 'react';
// import { style } from './../style/global';
import axios from 'axios';

const Order = () => {
  const [orders, setOrders] = useState("")

  useEffect(() => {
    const getOrders = async () => {
        try {
            const {data} = await axios.get("http://192.168.1.22:8000/order/");
            setOrders(data.results)
            console.log(data.results)
        } catch (error) {
            console.log(error)
        }
    }
    getOrders();
  }, []);
  console.log("O: ", orders)
  if (orders === "")
    return ( <Text>No data</Text>)
  return (
    <View>
      <Text>Order</Text>
      <View>
        {orders.map((o) => {
          return(
            <>
            <View key={o.id}>
              <Text>{o.title}</Text>
              <Text>{o.content}</Text>
              <Text>{o.customer.first_name} {o.customer.first_name}</Text>
            </View>
              
            </>
          );
        })}
      </View>
      {/* <Text>{orders[0]}</Text> */}
    </View>
  );
};

export default Order;
