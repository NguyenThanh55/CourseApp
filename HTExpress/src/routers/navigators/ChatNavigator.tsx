import { View, Text } from 'react-native'
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Chat from './../../screens/Chat';


const ChatNavigator = () => {
    const ChatStack = createNativeStackNavigator();

  return (
    <ChatStack.Navigator>
      <ChatStack.Screen name="Chat" component={Chat}/>
    </ChatStack.Navigator>
  )
}

export default ChatNavigator