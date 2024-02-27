import { StatusBar } from "expo-status-bar";
import React, { useContext } from "react";
import {
  View,
  Text,
  FlatList,
  Dimensions,
  Image,
  SafeAreaView,
} from "react-native";
import MyContext from "../configs/MyContext";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";

const HistoryScreen = () => {
  const [user, dispatch] = useContext(MyContext);
  const paymentHistory = [
    { date: "2022-01-01", amount: 100 },
    { date: "2022-01-05", amount: 150 },
    { date: "2022-01-10", amount: 200 },
  ];

  const renderItem = ({ item }) => (
    <View
      style={{
        flexDirection: "row",
        justifyContent: "space-between",
        paddingHorizontal: 16,
        paddingVertical: 8,
      }}
    >
      <Text>{item.date}</Text>
      <Text>{item.amount}</Text>
    </View>
  );

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

      {/* list bills */}
      <View>
        <FlatList
          data={paymentHistory}
          keyExtractor={(item, index) => index.toString()}
          renderItem={renderItem}
        />
      </View>
    </View>
  );
};

export default HistoryScreen;
