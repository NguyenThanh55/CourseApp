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
  const [listOrder, setListOrder] = useState();
  const [filterOrder, setFilterOrder] = useState();

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

      if (user["role"] === "SHIPPER") {
        const res = await api.get(endpoints["my-order"], {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        });

        setListOrder(res.data);
      } else {
        const res = await api.get(endpoints["my-order"], {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        });
        console.log(res.data);
        setListOrder(res.data.filter((order) => order.shipper != null));
        setFilterOrder(res.data.filter((order) => order.shipper !== null));
        console.log(filterOrder);
      }
    } catch (error) {
      // Handle errors
      console.error("API Error:", error);
    }
  };
  const renderItem = ({ item }) => {
    return <Rating item={item} />;
  };

  return (
    <View className="flex-1 relative bg-white">
      <StatusBar />

      <Image
        source={require("../assets/images/beansBackground1.png")}
        style={{ height: height * 0.2 }}
        className="w-full absolute -top-5 opacity-10"
      />

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

      <View>
        <Carousel
          containerCustomStyle={{ overflow: "visible" }}
          data={filterOrder}
          renderItem={renderItem}
          firstItem={1}
          inactiveSlideScale={0.75}
          inactiveSlideOpacity={0.75}
          sliderHeight={height}
          itemHeight={height * 0.5}
          vertical={true} // Chuyển sang chế độ dọc
          slideStyle={{ display: "flex", alignItems: "center" }}
        />
      </View>
    </View>
  );
};

export default MyRatingScreen;
