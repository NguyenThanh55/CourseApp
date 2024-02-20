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
  TextInput,
  Alert,
  ScrollView,
  KeyboardAvoidingView,
  Keyboard
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

export default function ProductScreen(props) {
  const [user, dispatch] = useContext(MyContext);
  const item = props.route.params;
  const [size, setSize] = useState("small");
  const [listAuction, setListAuction] = useState();
  const navigation = useNavigation();
  const [selectedItem, setSelectedItem] = useState(null);
  const modalRef = useRef(null);
  const [loading, setLoading] = useState(false);
  const [loadingCreateAuction, setloadingCreateAuction] = useState(false);
  const [loadingUpdateAuction, setloadingUpdateAuction] = useState(false);
  const [myAuction, setMyAuction] = useState([]);
  const [isEdit, setIsEdit] = useState(false);

  const [auction, setAuction] = useState({
    title: `Đấu giá của ` + user.first_name + ' ' + user.last_name,
    content: "",
    money: "",
  });

  const change = (field, value) => {
    setAuction((current) => {
      return { ...current, [field]: value };
    });
  };


  const onChangeText = (field) => (value) => {
    console.log(field, value);
    change(field, value);
    console.log(auction.title);
  };


  const [keyboardOpen, setKeyboardOpen] = useState(false);


  useEffect(() => {
    // Call the async function
    fetchData();
  }, []);


  const fetchData = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    try {
      const api = authApi(accessToken);
      // Assuming you have an order_id, replace 'your_order_id_here' with your actual order_id
      const order_id = item.id;

      if (user.role === "SHIPPER") {
        const response = await api.get(`/user/` + user.id + `/auctions/`);
        // Check if listAuction is not undefined or null
        const filteredAuctions = response.data.filter(auction => auction.order.id === order_id);
        setMyAuction(filteredAuctions);
        console.log(myAuction);
      } else {
        const response = await api.get(`/order/` + order_id + `/auctions/`);
        setListAuction(response.data);
      }
    } catch (error) {
      // Handle errors
      console.error("API Error:", error);
    }
  };

  const updateOrder = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    try {
      const api = authApi(accessToken);

      const order_id = item.id;

      const response = await api.patch(
        `/order/${order_id}/update-shipper-for-order/`,
        {
          shipper: selectedItem.shipper.id,
          status: "Pending",
        }
      );

      if (response.status == 200) {
        navigation.navigate("order");
      }
    } catch (error) {
      // Handle errors
      console.error("API Error:", error);
    }
  };


  const createAuction = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    setloadingCreateAuction(true);
    try {
      const api = authApi(accessToken);
      const order_id = item.id;


      const response = await api.post(`/order/${order_id}/auction/`, auction);

      if (response.status == 201) {
        fetchData();
      } else {
        Alert("Lỗi", "Hệ thống đã xảy ra lỗi vui lòng thử lại sau")
      }

    } catch (error) {
      console.error("API Error: ", error);
    } finally {
      setloadingCreateAuction(false);
    }
  }

  const updateAuction = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    setloadingUpdateAuction(true);
    try {
      const api = authApi(accessToken);
      console.log(`/aution/${myAuction.id}/`);
      const response = await api.patch(`/aution/${myAuction.id}/`, auction);
      
      if (response.status == 200) {
        fetchData();
      } else {
        Alert("Lỗi", "Hệ thống đã xảy ra lỗi vui lòng thử lại sau")
      }

    } catch (error) {
      console.error("API Error: ", error);
    } finally {
      setloadingUpdateAuction(false);
    }

  }


  const handleSelectItem = (item) => {
    setSelectedItem(item);
    modalRef.current?.open();
  };

  const handlePhoneCall = () => {
    Linking.openURL(`tel:${phoneNumber}`);
  };

  const getStatusLabel = (status) => {
    switch (status) {
      case "New":
        return "Khởi tạo";
      case "Pending":
        return "Đang vận chuyển";
      case "Complete":
        return "Hoàn thành";
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
            <Text style={{ marginTop: 5, fontWeight: "600", color: 'red' }}>
              {formatMoney(item.money)}
            </Text>
          </View>
        </View>
      </TouchableOpacity>
    );
  };

  const handleEdit = () => {
    // Call your API to edit the auction
    setIsEdit(!isEdit);
  };

  const handleDelete = () => {
    Alert.alert(
      'Xác nhận',
      'Bạn chắc chắn muốn xóa đấu giá của mình?',
      [
        {
          text: 'Hủy',
          style: 'cancel',
        },
        {
          text: 'Xóa',
          onPress: () => {

          },
          style: 'destructive',
        },
      ]
    );
  };


  const formatMoney = (input) => {
    // Remove non-numeric characters
    const numericInput = input.replace(/[^0-9]/g, '');

    // Format the input as money
    const formattedMoney = parseFloat(numericInput).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });

    return formattedMoney;
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

        <KeyboardAvoidingView
          style={{ flex: 1 }}
          behavior={Platform.OS === 'ios' ? 'padding' : null}
          enabled
        >
          <ScrollView
            contentContainerStyle={{ flexGrow: 1 }}
            keyboardShouldPersistTaps="handled"
            scrollEnabled={!keyboardOpen}
          >
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
                    {moment(item.deliveryDate, "YYYY-DD-MM").format("DD/MM/YYYY")}
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


                  <FlatList
                    data={listAuction}
                    renderItem={({ item }) => (
                      <ActionListItem item={item} onPress={handleSelectItem} />
                    )}
                    keyExtractor={(item, index) => index.toString()}
                  />



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
                  {item.shipper && ( // Check if item.shipper is not null
                    <View style={styles.profileContainer}>
                      <Image
                        source={{ uri: item.shipper.avatar }}
                        style={styles.avatar}
                      />
                    </View>
                  )}
                  <View style={{ marginHorizontal: 22 }}>
                    {item.shipper && ( // Check if item.shipper is not null
                      <>
                        <Text style={styles.text}>
                          Tên: {item.shipper.first_name} {item.shipper.last_name}
                        </Text>
                        <Text style={styles.text}>Email: {item.shipper.email}</Text>
                        <Text style={styles.text}>
                          Số điện thoại: {item.shipper.phone}
                        </Text>
                        <PhoneCallButton phoneNumber={item.shipper.phone} />
                      </>
                    )}
                  </View>
                </View>
              )
            ) : (
              myAuction !== null &&
                myAuction.length !== 0 ? (
                <View className="px-4 space-y-2">
                  <Text
                    style={{ color: themeColors.text }}
                    className="text-lg font-bold"
                  >
                    Đấu giá của tôi
                  </Text>
                  {myAuction.map((auction, index) => (
                    isEdit ? (
                      <View key={index} className="px-4 space-y-2">
                        <View style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' }}>
                          <Text style={{ color: themeColors.text }} className="text-lg font-bold">
                            Đấu giá
                          </Text>
                          <TouchableOpacity onPress={handleEdit}>
                            <Text style={{ color: 'blue', marginRight: 10 }}>Hủy</Text>
                          </TouchableOpacity>
                        </View>
                        <View>
                          <Text style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}>
                            Tiêu đề đấu giá
                          </Text>
                          <View style={{ width: "100%", height: 48, borderColor: COLORS.black, borderWidth: 1, borderRadius: 8, alignItems: "center", justifyContent: "center", paddingLeft: 22 }}>
                            <TextInput
                              placeholder={auction.title}
                              placeholderTextColor={COLORS.black}
                              onChangeText={onChangeText("title")}
                              style={{ width: "100%" }}
                            />
                          </View>
                        </View>
                        <View>
                          <Text style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}>
                            Nội dung đấu giá
                          </Text>
                          <View style={{ width: "100%", height: 48, borderColor: COLORS.black, borderWidth: 1, borderRadius: 8, alignItems: "center", justifyContent: "center", paddingLeft: 22 }}>
                            <TextInput
                              placeholder={auction.content}
                              placeholderTextColor={COLORS.black}
                              onChangeText={onChangeText("content")}
                              style={{ width: "100%" }}
                            />
                          </View>
                        </View>
                        <View style={{ marginBottom: 24 }}>
                          <Text style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}>Tiền</Text>
                          <View style={{ width: "100%", height: 48, borderColor: COLORS.black, borderWidth: 1, borderRadius: 8, alignItems: "center", justifyContent: "center", paddingLeft: 22 }}>
                            <TextInput
                              placeholder={auction.money}
                              placeholderTextColor="black"
                              onChangeText={onChangeText("money")}
                              keyboardType="numeric"
                            />
                          </View>
                        </View>
                        {!loadingUpdateAuction ? (
                          <Button
                            title="Cập nhật đấu giá"
                            filled
                            onPress={updateAuction}
                            disabled={loadingUpdateAuction}
                            style={{ marginTop: 18, marginBottom: 4 }}
                          />
                        ) : (
                          <Button
                            title="Đang cập nhật"
                            filled
                            disabled={loadingUpdateAuction}
                            style={{ marginTop: 18, marginBottom: 4 }}
                          />
                        )}
                      </View>
                    ) : (
                      <View key={index} style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', paddingHorizontal: 10, paddingVertical: 5 }}>
                        <View style={{ flexDirection: 'row' }}>
                          <Image
                            source={{ uri: auction.shipper.avatar }}
                            style={{ width: 50, height: 50, borderRadius: 25 }}
                          />
                          <View style={{ marginLeft: 10 }}>
                            <Text style={{ fontSize: 16, fontWeight: "600" }}>
                              {auction.shipper.first_name} {auction.shipper.last_name}
                            </Text>
                            <Text>{auction.content}</Text>
                            <Text style={{ marginTop: 5, fontWeight: "600", color: "red" }}>
                              {formatMoney(auction.money)}
                            </Text>
                          </View>
                        </View>
                        <View style={{ flexDirection: 'row', alignItems: 'center' }}>
                          <TouchableOpacity onPress={handleEdit}>
                            <Text style={{ color: 'blue', marginRight: 10 }}>Sửa</Text>
                          </TouchableOpacity>
                          <TouchableOpacity onPress={handleDelete}>
                            <Text style={{ color: 'red' }}>Xóa</Text>
                          </TouchableOpacity>
                        </View>
                      </View>
                    )
                  ))}
                </View>
              ) : (
                <View className="px-4 space-y-2">
                  <Text
                    style={{ color: themeColors.text }}
                    className="text-lg font-bold"
                  >
                    Đấu giá
                  </Text>
                  <View>
                    <Text
                      style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                    >
                      Tiêu đề đấu giá
                    </Text>

                    <View
                      style={{
                        width: "100%",
                        height: 48,
                        borderColor: COLORS.black,
                        borderWidth: 1,
                        borderRadius: 8,
                        alignItems: "center",
                        justifyContent: "center",
                        paddingLeft: 22,
                      }}
                    >
                      <TextInput
                        placeholder="Nhập nội dung hàng hóa..."
                        placeholderTextColor={COLORS.black}
                        value={auction.title}
                        onChangeText={content => change("title", content)}
                        style={{
                          width: "100%",
                        }}
                      />
                    </View>
                  </View>

                  <View>
                    <Text
                      style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                    >
                      Nội dung đấu giá
                    </Text>

                    <View
                      style={{
                        width: "100%",
                        height: 48,
                        borderColor: COLORS.black,
                        borderWidth: 1,
                        borderRadius: 8,
                        alignItems: "center",
                        justifyContent: "center",
                        paddingLeft: 22,
                      }}
                    >
                      <TextInput
                        placeholder="Nhập nội dung đấu giá"
                        placeholderTextColor={COLORS.black}
                        value={auction.content}
                        onChangeText={content => change("content", content)}
                        style={{
                          width: "100%",
                        }}
                      />
                    </View>
                  </View>


                  <View style={{ marginBottom: 24 }}>
                    <Text
                      style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                    >
                      Tiền
                    </Text>

                    <View
                      style={{
                        width: "100%",
                        height: 48,
                        borderColor: COLORS.black,
                        borderWidth: 1,
                        borderRadius: 8,
                        alignItems: "center",
                        justifyContent: "center",
                        paddingLeft: 22,
                      }}
                    >
                      <TextInput
                        placeholder="Nhập số tiền mong muốn"
                        placeholderTextColor="black"
                        value={auction.money}
                        onChangeText={money => change("money", money)}
                        keyboardType="numeric"
                      />
                    </View>
                  </View>

                  {!loadingCreateAuction ? (
                    <Button
                      title="Đấu giá"
                      filled
                      onPress={createAuction}
                      disabled={loadingCreateAuction}
                      style={{
                        marginTop: 18,
                        marginBottom: 4,
                      }}
                    />
                  ) : (
                    <LoaddingButton
                      title="Đang tạo đấu giá"
                      filled
                      disabled={loadingCreateAuction}
                      style={{
                        marginTop: 18,
                        marginBottom: 4,
                      }}
                    />
                  )}

                </View>

              )
            )}
          </ScrollView>
        </KeyboardAvoidingView>


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
              <Text style={{ marginTop: 5, fontWeight: "600", color: 'red' }}>
                {formatMoney(selectedItem.money)}
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
