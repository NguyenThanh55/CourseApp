import React, { useReducer } from 'react'
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import HomeScreen from '../screens/HomeScreen';
import { Dimensions, LogBox, Platform, Text, View } from 'react-native';
import ProductScreen from '../screens/ProductScreen';
import ProfileScreen from '../screens/ProfileScreen';
import LoginScreen from '../screens/LoginScreen';
import { themeColors } from '../theme';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { HomeIcon as HomeOutline, ClipboardIcon as ClipboardOutline, UserIcon as UserOutline } from 'react-native-heroicons/outline';
import { HomeIcon as HomeSolid, ClipboardIcon as ClipboardSolid, UserIcon as UserSolid } from 'react-native-heroicons/solid';
import MyUserReducer from '../reducers/MyUserReducer';
import MyContext from "../configs/MyContext";
import Signup from '../screens/SingUpScreen';
import MyOrderScreen from './../screens/MyOrderScreen';



const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

const ios = Platform.OS == 'ios';
LogBox.ignoreLogs([
  'Non-serializable values were found in the navigation state',
]);




export default function AppNavigation() {


  const [user, dispatch] = useReducer(MyUserReducer, null);



  return (
    <MyContext.Provider value={[user, dispatch]}>
      <NavigationContainer>
        <Stack.Navigator screenOptions={{
          contentStyle: { backgroundColor: 'white' }
        }}>
          {user === null ?
            <>
              <Stack.Screen name="Login" options={{ headerShown: false }} component={LoginScreen} />
              <Stack.Screen name="Signup" component={Signup} options={{ headerShown: false}}  />
            </> :

            <>
              <Stack.Screen name="Home" options={{ headerShown: false }} component={HomeTabs} />
              <Stack.Screen name="Product" options={{ headerShown: false }} component={ProductScreen} />
            </>}

            {/* <Stack.Screen name="Login" options={{ headerShown: false }} component={LoginScreen} />
              <Stack.Screen name="Signup" component={Signup} options={{ headerShown: false}}  />
              <Stack.Screen name="Home" options={{ headerShown: false }} component={HomeTabs} />
              <Stack.Screen name="Product" options={{ headerShown: false }} component={ProductScreen} />
              <Stack.Screen name="Profile" options={{ headerShown: false }} component={ProfileScreen} /> */}


        </Stack.Navigator>
      </NavigationContainer>
    </MyContext.Provider>

  )

}

function HomeTabs() {
  return (
    <Tab.Navigator screenOptions={({ route }) => ({
      headerShown: false,
      tabBarShowLabel: false,
      tabBarIcon: ({ focused }) => menuIcons(route, focused),
      tabBarStyle: {
        marginBottom: 20,
        height: 75,
        alignItems: 'center',

        borderRadius: 100,
        marginHorizontal: 20,
        backgroundColor: themeColors.bgDark,

      },
      tabBarItemStyle: {
        marginTop: ios ? 30 : 0,

      }
    })}

    >
      <Tab.Screen name="home" component={HomeScreen} />
      <Tab.Screen name="order" component={MyOrderScreen} />
      <Tab.Screen name="profile" component={ProfileScreen} />
    </Tab.Navigator>
  )
}

const menuIcons = (route, focused) => {
  let icon;


  if (route.name === 'home') {
    icon = focused ? <HomeSolid size="30" color={themeColors.bgDark} /> : <HomeOutline size="30" strokeWidth={2} color="white" />
  } else if (route.name === 'order') {
    icon = focused ? <ClipboardSolid size="30" color={themeColors.bgDark} /> : <ClipboardOutline size="30" strokeWidth={2} color="white" />
  } else if (route.name === 'profile') {
    icon = focused ? <UserSolid size="30" color={themeColors.bgDark} /> : <UserOutline size="30" strokeWidth={2} color="white" />
  }


  let buttonClass = focused ? "bg-white" : "";
  return (
    <View className={"flex items-center rounded-full p-3 shadow " + buttonClass}>
      {icon}
    </View>
  )
}