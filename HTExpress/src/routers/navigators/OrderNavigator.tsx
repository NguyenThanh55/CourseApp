import { View, Text } from 'react-native'
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Order from './../../screens/Order';

const OrderNavigator = () => {
    const OrderStack = createNativeStackNavigator();
  return (
    <OrderStack.Navigator>
      <OrderStack.Screen name="Order" component={Order} />
    </OrderStack.Navigator>
  )
}

export default OrderNavigator