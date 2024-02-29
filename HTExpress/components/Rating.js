import {
  View,
  Text,
  Image,
  TouchableOpacity,
  TouchableWithoutFeedback,
  Dimensions,
  Platform,
  Animated,
  StyleSheet,
  ScrollView,
} from "react-native";
import React from "react";
import { themeColors } from "../theme";
import { useNavigation } from "@react-navigation/native";
import { StarIcon } from "react-native-heroicons/solid";
import { PlusIcon } from "react-native-heroicons/outline";
import moment from "moment";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";
export default function Rating({ item }) {
  const navigation = useNavigation();

  return (
    <View
      style={{
        borderRadius: 20,
        backgroundColor: themeColors.bgDark,
        width: width * 0.95,
        margin: 10,
      }}
    >
      <View style={styles.boxRow}>
        {/* Image */}
        <View
          style={{
            shadowColor: "black",
            shadowRadius: 30,
            shadowOffset: { width: 0, height: 40 },
            shadowOpacity: 0.8,
            marginTop: ios ? 15 : 15,
            paddingLeft: 10,
          }}
          className="flex-row justify-center"
        >
          <Image
            style={{ borderRadius: 50 }}
            source={{ uri: item.user.avatar }}
            className="h-20 w-20"
          />
        </View>
        {/* content */}
        <View className="ml-3">
          <View className="space-y-3 mt-3">
            <Text
              style={{
                fontSize: 20, // Adjust the font size as needed
                color: "white",
                fontWeight: "bold",
                lineHeight: 24, // Adjust the line height as needed
              }}
              numberOfLines={null}
              ellipsizeMode="tail"
            >
              Đánh giá của đơn {item.order.id}
            </Text>
            <View className="flex-row space-x-1 z-10">
              <Text className="text-xxl text-white font-semibold opacity-60">
                Sản phẩm:
              </Text>
              <Text className="text-xxl text-white font-semibold ">
                {" "}
                {item.order.content}
              </Text>
            </View>
          </View>
        </View>
      </View>
      <View className="ml-2 mt-3">
        <View className="flex-row justify-between items-center mb-5">
          <Text className="text-xxl text-white font-semibold opacity-60">
            Nội dung đánh giá:
          </Text>
          <Text
            className="text-xxl text-white font-semibold mr-3"
            numberOfLines={null}
            ellipsizeMode="tail"
          >
            {" "}
            {item.content}
          </Text>
        </View>
        <View className="flex-row justify-between items-center mb-5">
          <Text className="text-xxl text-white font-semibold opacity-60">
            Đánh giá:
          </Text>
          <Text className="text-xxl text-white font-semibold mr-3">
            {" "}
            {item.score}
          </Text>
        </View>
        <View
          style={{
            backgroundColor: ios ? themeColors.bgDark : "transparent",
      
          }}
          className="flex-row justify-between items-center mb-5"
        >
          <Text className="text-xxl text-white font-semibold opacity-60">
            Ngày đánh giá:
          </Text>
          <Text className="text-white font-bold text-xxl mr-3">
            {moment(item.updated_date, "YYYY-MM-DD").format("DD-MM-YYYY")}
          </Text>
        </View>
      </View>
    </View>
    // <View
    //   style={{
    //     borderRadius: 40,
    //     backgroundColor: themeColors.bgDark,
    //     height: ios ? height * 0.4 : height * 0.2,
    //     width: width * 0.95,
    //     marginLeft: 10,
    //     marginRight: 10,
    //   }}
    // >
    //   <View style={styles.boxRow}>
    //     {/* Image */}
    //     <View
    //       style={{
    //         shadowColor: "black",
    //         shadowRadius: 30,
    //         shadowOffset: { width: 0, height: 40 },
    //         shadowOpacity: 0.8,
    //         marginTop: ios ? -(height * 0.1) : 15,
    //         paddingLeft: 10,
    //       }}
    //       className="flex-row justify-center"
    //     >
    //       <Image
    //         style={{ borderRadius: 30 }}
    //         source={{ uri: item.image }}
    //         className="h-20 w-20"
    //       />
    //     </View>
    //     {/* content */}
    //     <View className="ml-2">
    //       <View className="space-y-3 mt-3">
    //         <Text
    //           style={{
    //             fontSize: 20, // Adjust the font size as needed
    //             color: "white",
    //             fontWeight: "bold",
    //             lineHeight: 24, // Adjust the line height as needed
    //           }}
    //           numberOfLines={2}
    //           ellipsizeMode="tail"
    //         >
    //           Đánh giá của đơn {item.title}
    //         </Text>
    //         <View className="flex-row space-x-1 z-10">
    //           <Text className="text-xxl text-white font-semibold opacity-60">
    //             Sản phẩm:
    //           </Text>
    //           <Text className="text-xxl text-white font-semibold ">
    //             {" "}
    //             {item.content}
    //           </Text>
    //         </View>
    //       </View>
    //     </View>
    //     <View className="space-y-3 mt-3">
    //       <View className="flex-row space-x-1 z-10">
    //         <Text className="text-xxl text-white font-semibold opacity-60">
    //           Từ:
    //         </Text>
    //         <Text className="text-xxl text-white font-semibold ">
    //           {" "}
    //           {item.from_address}
    //         </Text>
    //       </View>
    //       <View className="flex-row space-x-1 z-10">
    //         <Text className="text-xxl text-white font-semibold opacity-60">
    //           Đến:
    //         </Text>
    //         <Text className="text-sm text-white font-semibold">
    //           {" "}
    //           {item.to_address}
    //         </Text>
    //       </View>
    //     </View>

    //     <View
    //       style={{
    //         backgroundColor: ios ? themeColors.bgDark : "transparent",
    //         shadowColor: themeColors.bgDark,
    //         shadowRadius: 25,
    //         shadowOffset: { width: 0, height: 40 },
    //         shadowOpacity: 0.8,
    //       }}
    //       className="flex-row justify-between items-center mb-5"
    //     >
    //       <Text className="text-white font-bold text-lg">
    //         {moment(item.deliveryDate, "YYYY-DD-MM").format("DD/MM/YYYY")}
    //       </Text>
    //       <TouchableOpacity
    //         onPress={() => navigation.navigate("Product", { ...item })}
    //         style={{
    //           shadowColor: "black",
    //           shadowRadius: 40,
    //           shadowOffset: { width: -20, height: -10 },
    //           shadowOpacity: 1,
    //         }}
    //         className="p-4 bg-white rounded-full"
    //       >
    //         <PlusIcon size="25" strokeWidth={2} color={themeColors.bgDark} />
    //       </TouchableOpacity>
    //     </View>
    //   </View>
    // </View>
  );
}
const styles = StyleSheet.create({
  boxRow: {
    display: "flex",
    flexDirection: "row",
  },
});
