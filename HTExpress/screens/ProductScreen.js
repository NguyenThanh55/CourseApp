import {
  View,
  Text,
  TouchableOpacity,
  Image,
  Dimensions,
  Platform,
  Animated,
  FlatList,
  Modal,
  StyleSheet,
  Linking,
} from "react-native";
import React, { useState, useEffect, useRef, useContext } from "react";
import { useNavigation } from "@react-navigation/native";
import { StatusBar } from "expo-status-bar";
import { SafeAreaView } from "react-native-safe-area-context";
import {
  ArrowLeftCircleIcon,
  MinusIcon,
  PlusIcon,
} from "react-native-heroicons/outline";
import { HeartIcon, StarIcon } from "react-native-heroicons/solid";
import { themeColors } from "../theme";
import { ShoppingBag } from "react-native-feather";
import moment from "moment";
import AsyncStorage from "@react-native-async-storage/async-storage";
import API, { authApi, endpoints } from "../configs/APIs";
import { Modalize } from "react-native-modalize";
import { GestureHandlerRootView } from "react-native-gesture-handler";
import COLORS from "./../constants/colors";
import Button from "../components/Button";
import LoaddingButton from "../components/LoaddingButton";
import MyContext from "../configs/MyContext";
import { MapPinIcon as MapPinOutline } from "react-native-heroicons/outline";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";

export default function FavouriteScreen(props) {
  const [user, dispatch] = useContext(MyContext);
  const item = props.route.params;
  const [size, setSize] = useState("small");
  const [listAuction, setListAuction] = useState(null);
  const navigation = useNavigation();
  const [selectedItem, setSelectedItem] = useState(null);
  const modalRef = useRef(null);
  const [loading, setLoading] = useState(false);
  const [myAuction, setMyAuction] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      const accessToken = await AsyncStorage.getItem("access-token");
      try {
        const api = authApi(accessToken);
        // Assuming you have an order_id, replace 'your_order_id_here' with your actual order_id
        const order_id = item.id;

        const response = await api.get(`/order/` + order_id + `/auctions/`);

        setListAuction(response.data);

        if (user.role === "SHIPPER") {
          // Check if listAuction is not undefined or null
          console.log(response.data);
          const filteredAuctions = response.data.filter(
            (auction) => auction.shipper.id === user.id
          );
          await setMyAuction(filteredAuctions);
          console.log(myAuction);
        }
      } catch (error) {
        // Handle errors
        console.error("API Error:", error);
      }
    };

    // Call the async function
    fetchData();
  }, []);

  console.log(listAuction);
  console.log(myAuction);

  const updateOrder = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    try {
      const api = authApi(accessToken);

      const order_id = item.id;

      const response = await api.patch(
        `/order/${order_id}/update_shipper_for_order/`,
        {
          shipper: selectedItem.shipper.id,
          status: "Pending",
        }
      );

      console.log(response.data);
    } catch (error) {
      // Handle errors
      console.error("API Error:", error);
    }
  };

  const handleSelectItem = (item) => {
    setSelectedItem(item);
    modalRef.current?.open();
  };

  const handlePhoneCall = () => {
    Linking.openURL(`tel:${phoneNumber}`);
  };

  const getStatusLabel = (status) => {
    switch (status) {
      case 'New':
        return 'Khởi tạo';
      case 'Pending':
        return 'Đang vận chuyển';
      case 'Complete':
        return 'Hoàn thành';
      default:
        return status; // Return original status if no mapping is defined
    }
  };



  const PhoneCallButton = ({ phoneNumber }) => {
    const handlePhoneCall = () => {
      Linking.openURL(`tel:${phoneNumber}`);
    };

    return (
      <View>
        <Button title="Gọi tài xế" onPress={handlePhoneCall} />
      </View>
    );
  };

  const ActionListItem = ({ item, onPress }) => {
    return (
      <TouchableOpacity onPress={() => onPress(item)}>
        <View
          style={{ flexDirection: "row", alignItems: "center", padding: 10 }}
        >
          <Image
            source={{ uri: item.shipper.avatar }}
            style={{ width: 50, height: 50, borderRadius: 25 }}
          />
          <View style={{ marginLeft: 10 }}>
            <Text style={{ fontSize: 16, fontWeight: "600" }}>
              {item.shipper.first_name} {item.shipper.last_name}
            </Text>
            <Text>{item.content}</Text>
            <Text style={{ marginTop: 5, fontWeight: "600" }}>
              {item.money} VND
            </Text>
          </View>
        </View>
      </TouchableOpacity>
    );
  };

  return (
    <View className="flex-1">
      <StatusBar style="light" />
      <Image
        source={require("../assets/images/beansBackground2.png")}
        style={{
          height: 200,
          borderBottomLeftRadius: 50,
          borderBottomRightRadius: 50,
        }}
        className="w-full absolute"
      />
      <SafeAreaView className="space-y-4 flex-1">
        <View className="mx-4 flex-row justify-between items-center">
          <TouchableOpacity
            className=" rounded-full "
            onPress={() => navigation.goBack()}
          >
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
          className="flex-row justify-center"
        >
          <Image
            source={{ uri: item.image }}
            className="h-60 w-60"
            style={{ marginTop: ios ? -40 : 40 }}
          />
        </View>

        <View className="px-4 space-y-2">
          <Text
            style={{ color: themeColors.text }}
            className="text-lg font-bold"
          >
            Thông tin đơn hàng
          </Text>
          <View className="flex-column justify-between">
            <View className="flex-row px-2 space-x-2 items-center justify-between">
              <Text className="text-base text-gray-700 font-semibold opacity-60">
                Mã đơn hàng:
              </Text>
              <Text className="text-base text-gray-700 font-medium">
                {item.id}
              </Text>
            </View>

            <View className="flex-row px-2 space-x-2 items-center justify-between">
              <Text className="text-base text-gray-700 font-semibold opacity-60">
                Trạng thái đơn hàng:
              </Text>
              <Text className="text-base text-gray-700 font-medium">
              {getStatusLabel(item.status)}
              </Text>
            </View>

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
              <MapPinOutline size="25" strokeWidth={2} color="grey" />
              <Text className="text-sm text-gray-700 font-medium">
                {item.from_address}
              </Text>
            </View>

            <View className="flex-row px-2 space-x-2 items-center justify-between">
              <MapPinOutline size="25" strokeWidth={2} color="green" />
              <Text className="text-sm text-gray-700 font-medium">
                {item.to_address}
              </Text>
            </View>

            <View className="flex-row px-2 space-x-2 items-center justify-between">
              <Text className="text-base text-gray-700 font-semibold opacity-60">
                Ngày vận chuyển:
              </Text>
              <Text className="text-base text-gray-700 font-medium">
                {moment(item.deliveryDate, "YYYY-MM-DD").format("DD/MM/YYYY")}
              </Text>
            </View>
          </View>
        </View>

        {user.role == "CUSTOMER" ? (
          item.status === "New" ? (
            <View className="px-4 space-y-2">
              <Text
                style={{ color: themeColors.text }}
                className="text-lg font-bold"
              >
                Danh sách đấu giá
              </Text>
              <Text className="text-gray-600">{item.desc}</Text>

              {listAuction !== null && listAuction.length !== 0 && (
                <FlatList
                  data={listAuction}
                  renderItem={({ item }) => (
                    <ActionListItem item={item} onPress={handleSelectItem} />
                  )}
                  keyExtractor={(item, index) => index.toString()}
                />
              )}
            </View>
          ) : (
            <View className="px-4 space-y-2">
              <Text
                style={{ color: themeColors.text }}
                className="text-lg font-bold"
              >
                Tài xế:
              </Text>
              <Text className="text-gray-600">{item.desc}</Text>
              <View style={styles.profileContainer}>
                <Image
                  source={{ uri: item.shipper.avatar }}
                  style={styles.avatar}
                />
              </View>
              <View style={{ marginHorizontal: 22 }}>
                <Text style={styles.text}>
                  Tên: {item.shipper.first_name} {item.shipper.last_name}
                </Text>
                <Text style={styles.text}>Email: {item.shipper.email}</Text>
                <Text style={styles.text}>
                  Số điện thoại: {item.shipper.phone}
                </Text>
                <PhoneCallButton phoneNumber={item.shipper.phone} />
              </View>
            </View>
          )
        ) : (
          myAuction !== null &&
          myAuction.length !== 0 && (
            <View className="px-4 space-y-2">
              <Text
                style={{ color: themeColors.text }}
                className="text-lg font-bold"
              >
                Đáu giá của tôi
              </Text>
              <View
                style={{
                  flexDirection: "row",
                  alignItems: "center",
                  padding: 10,
                }}
              >
                <Image
                  source={{ uri: myAuction.shipper.avatar }}
                  style={{ width: 50, height: 50, borderRadius: 25 }}
                />
                <View style={{ marginLeft: 10 }}>
                  <Text style={{ fontSize: 16, fontWeight: "600" }}>
                    {myAuction.shipper.first_name} {myAuction.shipper.last_name}
                  </Text>
                  <Text>{myAuction.content}</Text>
                  <Text style={{ marginTop: 5, fontWeight: "600" }}>
                    {myAuction.money} VND
                  </Text>
                </View>
              </View>
            </View>
          )
        )}
      </SafeAreaView>
      {selectedItem && (
        <View style={styles.bottomSheetContainer}>
          <TouchableOpacity
            onPress={() => setSelectedItem(null)}
            style={styles.closeButton}
          >
            <Text style={styles.closeButtonText}>Hủy</Text>
          </TouchableOpacity>
          <View
            style={{ flexDirection: "row", alignItems: "center", padding: 10 }}
          >
            <Image
              source={{ uri: selectedItem.shipper.avatar }}
              style={{ width: 50, height: 50, borderRadius: 25 }}
            />
            <View style={{ marginLeft: 10 }}>
              <Text style={{ fontSize: 16, fontWeight: "600" }}>
                {selectedItem.shipper.first_name}{" "}
                {selectedItem.shipper.last_name}
              </Text>
              <Text>{selectedItem.content}</Text>
              <Text style={{ marginTop: 5, fontWeight: "600" }}>
                {selectedItem.money} VND
              </Text>
            </View>
          </View>

          {!loading ? (
            <Button
              title="Xác nhận"
              filled
              onPress={updateOrder}
              disabled={loading}
              style={{
                marginTop: 18,
                marginBottom: 4,
              }}
            />
          ) : (
            <LoaddingButton
              title="Đang cập nhật"
              filled
              disabled={loading}
              style={{
                marginTop: 18,
                marginBottom: 4,
              }}
            />
          )}
        </View>
      )}
      <View className={`space-y-3 ${ios ? "mb-6" : "mb-3"}`}></View>
    </View>
  );
}

const styles = StyleSheet.create({
  bottomSheetContainer: {
    position: "absolute",
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: "#fff",
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
    padding: 20,
    height: "30%", // Adjust the height as needed
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: -3,
    },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 5,
  },
  closeButton: {
    alignSelf: "flex-end",
    marginTop: 10,
  },
  closeButtonText: {
    fontSize: 16,
    color: COLORS.primary,
    fontWeight: "bold",
  },

  profileContainer: {
    alignItems: "center", // To center items horizontally
  },
  avatar: {
    width: 100,
    height: 100,
    borderRadius: 50,
    marginBottom: 16,
  },
  text: {
    fontSize: 16,
    marginBottom: 8,
  },
});
