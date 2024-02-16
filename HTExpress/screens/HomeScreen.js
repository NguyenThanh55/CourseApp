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
  StyleSheet 
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
import COLORS from "../constants/colors";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";
export default function HomeScreen({ navigation }) {
  const [user, dispatch] = useContext(MyContext);
  const [activeCategory, setActiveCategory] = useState(1);
  const [listOrder, setListOrder] = useState();
  const [filterOrder, setFilterOrder] = useState();

  useEffect(() => {
    const fetchData = async () => {
      const accessToken = await AsyncStorage.getItem("access-token");
      try {
        const api = authApi(accessToken);

        if (user["role"] === "SHIPPER") {
          const res = await api.get(endpoints["all-order-for-shipper"], {
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
          });

          setListOrder(res.data);
          setFilterOrder(res.data);
          console.log(filterOrder);
        } else {
          const res = await api.get(endpoints["my-order"], {
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
          });

          setListOrder(res.data.filter((order) => order.shipper === null));

          setFilterOrder(res.data.filter((order) => order.shipper === null));
        }
      } catch (error) {
        // Handle errors
        console.error("API Error:", error);
      }
    };

    // Call the async function
    fetchData();
  }, []);


  const goToCreateOrderScreen = () => {
    navigation.navigate("Create");
  }

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
            {user.role === "CUSTOMER" ? (
              <Text className="font-semibold text-base">
                Đơn hàng đang đấu giá
              </Text>
            ) : (
              <Text className="font-semibold text-base">Đấu giá đơn hàng</Text>
            )}
          </View>
          <BellIcon size="27" color="black" />
        </View>

        <TouchableOpacity style={styles.button} onPress={goToCreateOrderScreen}>
      <Text style={styles.buttonText}>Tạo đơn hàng</Text>
    </TouchableOpacity>

        {/* search bar */}
        <View className="mx-5 shadow" style={{ marginTop: 10 }}>
          <View className="flex-row items-center rounded-full p-1 bg-[#e6e6e6]">
            <TextInput
              placeholder="Lọc theo địa chỉ"
              className="p-4 flex-1 font-semibold text-gray-700"
            />
            <TouchableOpacity
              className="rounded-full p-2"
              style={{ backgroundColor: themeColors.bgLight }}
            >
              <MagnifyingGlassIcon size="25" strokeWidth={2} color="white" />
            </TouchableOpacity>
          </View>
        </View>

        {/* categories */}
        <View className="px-5 mt-6">
          <FlatList
            horizontal
            showsHorizontalScrollIndicator={false}
            data={categories}
            keyExtractor={(item) => item.id}
            className="overflow-visible"
            renderItem={({ item }) => {
              isActive = item.id == activeCategory;
              let activeTextClass = isActive ? "text-white" : "text-gray-700";
              return (
                <TouchableOpacity
                  onPress={() => {
                    setActiveCategory(item.id);
                    if (item.id == 1) {
                      setFilterOrder(listOrder);
                    } else {
                      const filteredData = listOrder.filter(
                        (order) => order.title === item.title
                      );
                      setFilterOrder(filteredData);
                    }
                  }}
                  style={{
                    backgroundColor: isActive
                      ? themeColors.bgLight
                      : "rgba(0,0,0,0.07)",
                  }}
                  className="p-4 px-5 mr-2 rounded-full shadow"
                >
                  <Text className={"font-semibold " + activeTextClass}>
                    {item.title}
                  </Text>
                </TouchableOpacity>
              );
            }}
          />
        </View>
      </SafeAreaView>

      {/* coffee cards */}
      <View
        className={`overflow-visible flex justify-center flex-1 ${
          ios ? "mt-5" : ""
        }`}
      >
        <View>
          <Carousel
            containerCustomStyle={{ overflow: "visible" }}
            data={filterOrder}
            renderItem={({ item }) => <OrderCard item={item} />}
            firstItem={1}
            inactiveSlideScale={0.75}
            inactiveSlideOpacity={0.75}
            sliderWidth={width}
            itemWidth={width * 0.7}
            slideStyle={{ display: "flex", alignItems: "center" }}
          />
        </View>
      </View>
    </View>
  );
}


const styles = StyleSheet.create({
  button: {
    backgroundColor: themeColors.bgDark,
    padding: 10,
    borderRadius: 5,
    alignItems: 'center',
    justifyContent: 'center',
    margin: 10,
  },
  buttonText: {
    color: 'white',
    fontSize: 16,
    fontWeight: 'bold',
  },
});