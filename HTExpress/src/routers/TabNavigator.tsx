import {View, Text} from 'react-native';
import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import HomeNavigator from './navigators/HomeNavigator';
import {Home,BoxTime, Messages1, User} from 'iconsax-react-native';
import ProfileNavigator from './navigators/ProfileNavigator';
import OrderNavigator from './navigators/OrderNavigator';
import ChatNavigator from './navigators/ChatNavigator';
import RowComponent from '../components/RowComponent'
import { styles } from './../style/global';

const TabNavigator = () => {
  const Tabs = createBottomTabNavigator();
  return(
    <NavigationContainer>
    <Tabs.Navigator
      screenOptions={({route}) => ({
        tabBarShowLabel: false,
        headerShown: false,
        tabBarStyle: {
          justifyContent: 'space-between',
          alignItems: 'center',
          paddingVertical: 12,
          paddingHorizontal:12,
          height: 60
        },
        tabBarIcon: ({focused, color, size}) => {
          size = 20;
          if (route.name === 'HomeStack') {
            return(
              <RowComponent localStyles={{
                backgroundColor: focused ? '#e0e0e0' : '#fff'
              }}>
                <Home size={size} color={focused ? 'coral' : '#676767'} />
                {
                  focused && <Text style={[styles.tabLabel]}>Home</Text>
                }
              </RowComponent>
            );
          } 
          if (route.name === 'OrderStack') {
            return (
              <RowComponent localStyles={{
                backgroundColor: focused ? '#e0e0e0' : '#fff'
              }}>
                <BoxTime size={size} color={focused ? 'coral' : '#676767'} />
                {
                  focused && <Text style={[styles.tabLabel]}>Shipping</Text>
                }
              </RowComponent>
            
            );
              
          } 
          if (route.name === 'ChatStack') {
            return (
              <RowComponent localStyles={{
                backgroundColor: focused ? '#e0e0e0' : '#fff'
              }}>
                <Messages1 size={size} color={focused ? 'coral' : '#676767'} />
                {
                  focused && <Text style={[styles.tabLabel]}>Chat</Text>
                }
              </RowComponent>
            );
              
          } 
          if (route.name === 'ProfileStack') {
            return (
              <RowComponent localStyles={{
                backgroundColor: focused ? '#e0e0e0' : '#fff'
              }}>
                <User size={size} color={focused ? 'coral' : '#676767'} />
                {
                  focused && <Text style={[styles.tabLabel]}>Profile</Text>
                }
              </RowComponent>
            );
          }
          
        },
      })}>
      <Tabs.Screen name="HomeStack" component={HomeNavigator} options={{headerTitle: 'Trang chủ'}}/>
      <Tabs.Screen name="OrderStack" component={OrderNavigator} options={{headerTitle: 'Đơn hàng'}}/>
      <Tabs.Screen name="ChatStack" component={ChatNavigator} options={{headerTitle: 'Tin nhắn'}}/>
      <Tabs.Screen name="ProfileStack" component={ProfileNavigator} options={{headerTitle: 'Trang cá nhân'}}/>
      
      
    </Tabs.Navigator>
  </NavigationContainer>
  );
};

export default TabNavigator;
