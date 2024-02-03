import { View, Text, TouchableOpacity, Image, Dimensions, Platform, Animated } from 'react-native'
import React, { useState } from 'react'
import { useNavigation } from '@react-navigation/native'
import { StatusBar } from 'expo-status-bar';
import { SafeAreaView } from 'react-native-safe-area-context';
import { ArrowLeftCircleIcon, MinusIcon, PlusIcon } from 'react-native-heroicons/outline';
import { HeartIcon, StarIcon } from 'react-native-heroicons/solid';
import { themeColors } from '../theme';
import { ShoppingBag } from 'react-native-feather';
import moment from 'moment';


const { width, height } = Dimensions.get('window');
const ios = Platform.OS == 'ios';


export default function FavouriteScreen(props) {
  const item = props.route.params;
  const [size, setSize] = useState('small');
  const navigation = useNavigation();
 


  return (
    <View className="flex-1">
      <StatusBar style="light" />
      <Image
        source={require('../assets/images/beansBackground2.png')}
        style={{ height: 200, borderBottomLeftRadius: 50, borderBottomRightRadius: 50 }}
        className="w-full absolute" />
      <SafeAreaView className="space-y-4 flex-1">
        <View className="mx-4 flex-row justify-between items-center">
          <TouchableOpacity className=" rounded-full " onPress={() => navigation.goBack()}>
            <ArrowLeftCircleIcon size="50" strokeWidth={1.2} color="white" />
          </TouchableOpacity>

          <TouchableOpacity className=" rounded-full border-2 border-white p-2">
            <HeartIcon size="24" color="white" />
          </TouchableOpacity>
        </View>
        <View
          style={{
            shadowColor: themeColors.bgDark,
            shadowRadius: 30,
            shadowOffset: { width: 0, height: 30 },
            shadowOpacity: 0.9,
          }}
          className="flex-row justify-center">
         
          <Image source={{ uri: item.image }} className="h-60 w-60" style={{ marginTop: ios ? -40 : 40 }} />
          
        </View>

        
        <View className="px-4 space-y-2">
          <Text style={{ color: themeColors.text }} className="text-lg font-bold">Thông tin đơn hàng</Text>
          <View className="flex-column justify-between">

          <View className="flex-row px-2 space-x-2 items-center justify-between">
            <Text className="text-base text-gray-700 font-semibold opacity-60">
              Khách hàng:
            </Text>
            <Text className="text-base text-gray-700 font-medium">
            {item.customer.first_name} {item.customer.last_name}
            </Text>
          </View>
          

          <View className="flex-row px-2 space-x-2 items-center justify-between">
            <Text className="text-base text-gray-700 font-semibold opacity-60">
              Loại hàng hóa:
            </Text>
            <Text className="text-base text-gray-700 font-medium">
              {item.title}
            </Text>
          </View>

          <View className="flex-row px-2 space-x-2 items-center justify-between">
            <Text className="text-base text-gray-700 font-semibold opacity-60">
              Chi tiết hàng hóa:
            </Text>
            <Text className="text-base text-gray-700 font-medium">
              {item.content}
            </Text>
          </View>

          <View className="flex-row px-2 space-x-2 items-center justify-between">
            <Text className="text-base text-gray-700 font-semibold opacity-60">
              Từ:
            </Text>
            <Text className="text-base text-gray-700 font-medium">
              {item.from_address}
            </Text>
          </View>


          <View className="flex-row px-2 space-x-2 items-center justify-between">
            <Text className="text-base text-gray-700 font-semibold opacity-60">
              Đến:
            </Text>
            <Text className="text-base text-gray-700 font-medium">
              {item.to_address}
            </Text>
          </View>
          
          
          <View className="flex-row px-2 space-x-2 items-center justify-between">
            <Text className="text-base text-gray-700 font-semibold opacity-60">
              Ngày vận chuyển: 
            </Text>
            <Text className="text-base text-gray-700 font-medium">
            {moment(item.deliveryDate, 'YYYY-MM-DD').format('DD/MM/YYYY')}
            </Text>
          </View>

            
          </View>
        </View>

        <View className="px-4 space-y-2">
          <Text style={{ color: themeColors.text }} className="text-lg font-bold">About</Text>
          <Text className="text-gray-600">
            {item.desc}
          </Text>
        </View>




      </SafeAreaView>
      <View className={`space-y-3 ${ios ? 'mb-6' : 'mb-3'}`}>
        
        {/* buy now button */}
        <View className="flex-row justify-between px-4">
          <TouchableOpacity
            style={{ backgroundColor: themeColors.bgLight }}
            className="p-4 rounded-full flex-1 ml-4">
            <Text className="text-center text-white text-base font-semibold">Xác nhận</Text>
          </TouchableOpacity>
        </View>
      </View>


    </View>
  )
}