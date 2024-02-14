import { View, Text, Image, TouchableOpacity, TouchableWithoutFeedback, Dimensions, Platform, Animated } from 'react-native'
import React from 'react'
import { themeColors } from '../theme'
import { useNavigation } from '@react-navigation/native'
import { StarIcon } from 'react-native-heroicons/solid';
import { PlusIcon } from 'react-native-heroicons/outline';
import moment from 'moment';


const { width, height } = Dimensions.get('window');
const ios = Platform.OS == 'ios';
export default function OrderCard({ item }) {
  const navigation = useNavigation();

  
  return (

    <TouchableOpacity
    onPress={() => navigation.navigate('Product', { ...item })}
      style={{
        borderRadius: 40,
        backgroundColor: themeColors.bgDark,
        height: ios ? height * 0.45 : height * 0.55,
        width: width * 0.65,
      }}
    >
      <View
        style={{
          shadowColor: 'black',
          shadowRadius: 30,
          shadowOffset: { width: 0, height: 40 },
          shadowOpacity: 0.8,
          marginTop: ios ? -(height * 0.08) : 15,
        }}
        className="flex-row justify-center">
        
        <Image
          source={{ uri: item.image }}
          className="h-40 w-40"
        />
      </View>
      <View className={`mr-3 px-5 flex-1 justify-between ${ios ? 'mt-5' : ''}`}>
        <View className="space-y-3 mt-3">
          <Text className="text-xxl text-white font-semibold z-10">
            {item.title}
          </Text>
          <Text
            style={{
              fontSize: 20,  // Adjust the font size as needed
              color: 'white',
              fontWeight: 'bold',
              lineHeight: 24, // Adjust the line height as needed
            }}
            numberOfLines={2}
            ellipsizeMode="tail"
          >
            {item.content}
          </Text>
          <View className="flex-row space-x-1 z-10">
            <Text className="text-xxl text-white font-semibold opacity-60">
              Từ:
            </Text>
            <Text className="text-xxl text-white font-semibold "> {item.from_address}</Text>
          </View>
          <View className="flex-row space-x-1 z-10">
            <Text className="text-xxl text-white font-semibold opacity-60">
              Đến:
            </Text>
            <Text className="text-sm text-white font-semibold"> {item.to_address}</Text>
          </View>

        </View>


        <View style={{
          backgroundColor: ios ? themeColors.bgDark : 'transparent',
          shadowColor: themeColors.bgDark,
          shadowRadius: 25,
          shadowOffset: { width: 0, height: 40 },
          shadowOpacity: 0.8,
        }} className="flex-row justify-between items-center mb-5">
          <Text className="text-white font-bold text-lg">{moment(item.deliveryDate, 'YYYY-DD-MM').format('DD/MM/YYYY')}</Text>
          <TouchableOpacity
            onPress={() => navigation.navigate('Product', { ...item })}
            style={{
              shadowColor: 'black',
              shadowRadius: 40,
              shadowOffset: { width: -20, height: -10 },
              shadowOpacity: 1,
            }} className="p-4 bg-white rounded-full">
            <PlusIcon size="25" strokeWidth={2} color={themeColors.bgDark} />
          </TouchableOpacity>
        </View>


      </View>

    </TouchableOpacity>

  )
}