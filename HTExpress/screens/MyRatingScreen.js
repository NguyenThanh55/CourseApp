import {
  View,
  Text,
  Image,
  TouchableOpacity,
  TextInput,
  FlatList,
  Dimensions,
  Platform,
  Button,
  RefreshControl,
  ActivityIndicator,
  ScrollView,
} from "react-native";
import React, { useState, useContext, useEffect } from "react";
import { SafeAreaView } from "react-native-safe-area-context";
import { themeColors } from "../theme";
import { StatusBar } from "expo-status-bar";
import { categories, coffeeItems } from "../constants";
import Carousel from "react-native-snap-carousel";
import OrderCard from "../components/OrderCard";
import { BellIcon, MagnifyingGlassIcon } from "react-native-heroicons/outline";
import { MapPinIcon } from "react-native-heroicons/solid";
import MyContext from "../configs/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";
import API, { authApi, endpoints } from "../configs/APIs";
import { useFocusEffect } from "@react-navigation/native";
import Rating from "../components/Rating";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";
const MyRatingScreen = () => {
  const [user, dispatch] = useContext(MyContext);
  const [activeCategory, setActiveCategory] = useState(1);
  const [listRating, setListRating] = useState(null);
  const [filterOrder, setFilterOrder] = useState();
  const userId = user.id;
  useEffect(() => {
    // Call the async function
    fetchData();
  }, []);

  useFocusEffect(
    React.useCallback(() => {
      fetchData();
    }, [])
  );

  const fetchData = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    try {
      const api = authApi(accessToken);
      let res = await api.get(endpoints["ratings"](userId));
      if(res.data !== "No data") {
        setListRating(res.data);
      }
      
    } catch (error) {
      // Handle errors
      console.error("API Error:", error);
    }
  };
  // const renderItem = ({ item }) => {
  //   return <Rating item={item} />;
  // };

  return (
    <View className="flex-1 relative bg-white">
      <StatusBar />

     

      <SafeAreaView className={ios ? "-mb-8" : ""}>
        {/* avatar and bell icon */}
        <View className="mx-4 flex-row justify-between items-center">
          <Image
            source={{ uri: user.avatar }}
            className="h-9 w-9 rounded-full"
          />

          <View className="flex-row items-center space-x-2">
            <Text className="font-semibold text-base">Đánh giá của tôi</Text>
          </View>
        </View>
      </SafeAreaView>

      {/* coffee cards */}

      <View >
        <ScrollView className="mb-20">
          {listRating == null ? (
            <ActivityIndicator />
          ) : (
            <>
              {listRating.map((r) => (
                <Rating item={r} />
              ))}
            </>
          )}
        </ScrollView>
      </View>
    </View>
  );
};

export default MyRatingScreen;
