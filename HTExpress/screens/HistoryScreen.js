import { StatusBar } from "expo-status-bar";
import React, { useContext, useState, useEffect } from "react";
import {
  View,
  Text,
  FlatList,
  Dimensions,
  Image,
  SafeAreaView,
  ActivityIndicator,
} from "react-native";
import MyContext from "../configs/MyContext";
import { useFocusEffect } from "@react-navigation/native";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";

const HistoryScreen = () => {
  const [user, dispatch] = useContext(MyContext);
  const [bill, setBill] = useState(null);

  useEffect(() => {
    // Call the async function
    fetchData();
  }, []);

  useFocusEffect(
    React.useCallback(() => {
      fetchData();
    }, [])
  );
  console.log("User:" + user.id);
  const fetchData = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    try {
      const api = authApi(accessToken);
      let res = await api.get(endpoints["bills"](user.id));
      console.log("Res" + res);
      if (res.data !== "No data") {
        console.log("Data" + res.data);
        setBill(res.data);
      }
    } catch (error) {
      // Handle errors
      console.error("API Error:", error);
    }
  };

  // const renderItem = ({ item }) => (
  //   <View
  //     style={{
  //       flexDirection: "row",
  //       justifyContent: "space-between",
  //       paddingHorizontal: 16,
  //       paddingVertical: 8,
  //     }}
  //   >
  //     <Text>{item.updated_date}</Text>
  //     <Text>Đơn hàng {item.order.id}</Text>
  //     <Text>{item.total_money}</Text>
  //   </View>
  // );
  console.log(bill);
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
            <Text className="font-semibold text-base">Lịch sử thanh toán</Text>
          </View>
        </View>
      </SafeAreaView>

      {/* list bill */}
      <View>
        <FlatList>
          {bill == null ? (
            <ActivityIndicator />
          ) : (
            <>
              {bill.map((b) => {
                <View
                  style={{
                    flexDirection: "row",
                    justifyContent: "space-between",
                    paddingHorizontal: 16,
                    paddingVertical: 8,
                  }}
                >
                  <Text>{b.updated_date}</Text>
                  <Text>Đơn hàng {b.order.id}</Text>
                  <Text>{b.total_money}</Text>
                </View>;
              })}
            </>
          )}
        </FlatList>
      </View>
    </View>
  );
};

export default HistoryScreen;
