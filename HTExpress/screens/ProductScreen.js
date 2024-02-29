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
  Keyboard,
  DeviceEventEmitter, NativeModules, NativeEventEmitter
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
import { useFocusEffect } from '@react-navigation/native';



const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";

export default function ProductScreen(props) {
  const [user, dispatch] = useContext(MyContext);
  const item = props.route.params;
  const [size, setSize] = useState("small");
  const [listAuction, setListAuction] = useState();
  const [listVoucher, setListVoucher] = useState();
  const navigation = useNavigation();
  const [selectedItem, setSelectedItem] = useState(null);
  const modalRef = useRef(null);
  const [loading, setLoading] = useState(false);
  const [loadingCreateAuction, setloadingCreateAuction] = useState(false);
  const [loadingUpdateAuction, setloadingUpdateAuction] = useState(false);
  const [myAuction, setMyAuction] = useState([]);
  const [activeAuction, setActiveAuction] = useState([]);
  const [billOrder, setBill] = useState();
  const [isEdit, setIsEdit] = useState(false);
  const [vouchers, setVouchers] = useState([]);
  const [filterVouchers, setFilterVouchers] = useState([]);
  const [selectVoucher, setSelectVoucher] = useState();
  const [total, setTotal] = useState();
  const [orderrating, setOrderRating] = useState();

  const [auction, setAuction] = useState({
    title: `Đấu giá của ` + user.first_name + ' ' + user.last_name,
    content: "",
    money: "",
  });


  const [newAuction, setNewAuction] = useState({
    title: "",
    content: "",
    money: "",
  });



  const change = (field, value) => {
    setAuction((current) => {
      return { ...current, [field]: value };
    });
  };


  const onChangeText = (field) => (value) => {
    setNewAuction((current) => {
      return { ...current, [field]: value };
    });

  };


  const [keyboardOpen, setKeyboardOpen] = useState(false);


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
      // Assuming you have an order_id, replace 'your_order_id_here' with your actual order_id
      const order_id = item.id;

      if (user.role === "SHIPPER") {
        const response = await api.get(`/user/` + user.id + `/auctions/`);
        // Check if listAuction is not undefined or null
        const filteredAuctions = response.data.filter(auction => auction.order.id === order_id);
        setMyAuction(filteredAuctions);
      } else {
        const response = await api.get(`/order/` + order_id + `/auctions/`);
        if (response.data !== "No data" && response.data !== "") {
          setListAuction(response.data);
          console.log(response.data);
          if (item.status !== "New") {
            const shipper_id = item.shipper.id
            const res = await api.get(`/user/` + shipper_id + `/auctions/`);

            // Check if listAuction is not undefined or null
            const filteredAuctions = res.data.filter(auction => auction.order.id === order_id);
            // console.log(filteredAuctions);
            setActiveAuction(filteredAuctions);
            setTotal(filteredAuctions[0].money);
          }
          if (item.status === "Completed") {
            const urlBill = `/order/` + order_id + `/bill/`;
            const urlRatings = `/order/` + order_id + `/ratings/`
            const bill = await api.get(urlBill);
            const resrating = await api.get(urlRatings);
            if (bill.status == 200) {
              setBill(bill.data);
            }
            if (resrating.status == 200 && resrating.data !== "No data") {
              setOrderRating(resrating.data);
              console.log(resrating.data);
            }

          }
        }

        const vouchers = await api.get(endpoints["voucher"], {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        });
        setVouchers(vouchers.data);
        setFilterVouchers(vouchers.data);


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
    console.log(myAuction);
    const id = myAuction[0].id;
    try {
      const api = authApi(accessToken);
      console.log(`/aution/${id}/`);
      const response = await api.patch(`/auction/${id}/`, newAuction);

      if (response.status == 200) {
        fetchData();
        handleEdit();
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
      case "Completed":
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
        <Button filled title="Gọi tài xế" onPress={handlePhoneCall} />
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


  const Coupon = ({ discount, startDate, endDate, title, onPressButton }) => {
    return (
      <View style={styles.container}>
        <View style={styles.header}>
          <Text style={styles.headerText}>{title}</Text>
        </View>
        <View style={styles.content}>
          <View style={styles.rowContainer}>
            <Text style={styles.dateText}>Phần trăm giảm giá: </Text>
            <Text style={styles.labelText}>{discount * 100}%</Text>
          </View>
          <View style={styles.rowContainer}>
            <Text style={styles.dateText}>Ngày bắt đầu: </Text>
            <Text style={styles.labelText}>{moment(startDate, "YYYY-DD-MM").format("DD-MM-YYYY")}</Text>
          </View>
          <View style={styles.rowContainer}>
            <Text style={styles.dateText}>Ngày kết thúc: </Text>
            <Text style={styles.labelText}>{moment(endDate, "YYYY-DD-MM").format("DD-MM-YYYY")}</Text>
          </View>
          <TouchableOpacity style={styles.button} onPress={onPressButton}>
            <Text style={styles.buttonText}>Sử dụng</Text>
          </TouchableOpacity>
        </View>
      </View>
    );
  };



  const [rating, setRating] = useState(0);
  const [comment, setComment] = useState('');

  const handleRating = (value) => {
    setRating(value);
  };

  const handleCommentChange = (text) => {
    setComment(text);
  };

  const handleSubmitRating = async () => {
    if (rating === 0) {
      Alert.alert('Thông báo', 'Vui lòng chọn số điểm trước khi gửi đánh giá.');
      return;
    }


    const accessToken = await AsyncStorage.getItem("access-token");
    try {
      const api = authApi(accessToken);
      const order_id = item.id;

      try {
        const response = await api.post(`/order/${order_id}/rating/`, {
          "content": comment,
          "score": rating
        });
        console.log(response)
        if (response.status === 201) {
          fetchData();
          Alert.alert('Thông báo', `Đã gửi đánh giá: ${rating} sao. Nội dung: ${comment}`);
        } else {
          Alert.alert("Lỗi", "Hệ thống đã xảy ra lỗi, vui lòng thử lại sau");
        }
      } catch (error) {
        console.error("Error:", error);
        Alert.alert("Lỗi", "Hệ thống đã xảy ra lỗi, vui lòng thử lại sau");
      }


    } catch (error) {
      console.error("API Error: ", error);
    }

  };



  const payment = async () => {
    const accessToken = await AsyncStorage.getItem("access-token");
    try {
      const api = authApi(accessToken);
      const order_id = item.id;
      const decreased_money = activeAuction[0].money - total;
      const voucher_id = selectVoucher ? selectVoucher.id : null;

      if (voucher_id !== null) {
        try {
          const response = await api.post(`/order/${order_id}/vouchers/`, {
            "decreased_money": decreased_money,
            "voucher": voucher_id
          });
          console.log(response)
          if (response.status === 201) {
            fetchData();
            navigation.navigate('Checkout', { ...item });
          } else {
            Alert.alert("Lỗi", "Hệ thống đã xảy ra lỗi, vui lòng thử lại sau");
          }
        } catch (error) {
          console.error("Error:", error);
          Alert.alert("Lỗi", "Hệ thống đã xảy ra lỗi, vui lòng thử lại sau");
        }
      } else {
        Alert.alert("Thông báo", "Bạn chưa chọn voucher");
      }

    } catch (error) {
      console.error("API Error: ", error);
    } finally {
      setloadingCreateAuction(false);
    }

  }


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
          onPress: async () => {
            try {
              const accessToken = await AsyncStorage.getItem("access-token");
              const api = authApi(accessToken);
              const id = myAuction[0].id;

              const response = await api.delete(`/auction/${id}/`);

              if (response.status == 204) {
                fetchData();
              } else {
                Alert("Lỗi", "Hệ thống đã xảy ra lỗi vui lòng thử lại sau")
              }
            } catch (error) {
              console.error("API Error: ", error);
            }
          },
          style: 'destructive',
        },
      ]
    );
  };



  const handlePressShipper = () => {
    // Chuyển sang trang ShipperProfile và truyền props selectedItem.shipper
    // Điều này phụ thuộc vào cách bạn quản lý địa chỉ trang trong ứng dụng của bạn
    // Dưới đây là một ví dụ đơn giản:
    console.log(selectedItem.shipper);
    navigation.navigate('ShipperProfile', { shipper: selectedItem.shipper });
  };


  const confirm = () => {
    Alert.alert(
      'Xác nhận',
      'Bạn chắc chắn đã giao xong đơn hàng?',
      [
        {
          text: 'Hủy',
          style: 'cancel',
        },
        {
          text: 'Xác nhận',
          onPress: async () => {
            try {
              const accessToken = await AsyncStorage.getItem("access-token");
              const api = authApi(accessToken);
              const id = item.id;

              const response = await api.patch(`/order/${id}/update-shipper-for-order/`, {
                shipper: item.shipper.id,
                status: "Completed",
              });
              console.log(response);
              if (response.status == 200) {
                navigation.navigate("order");
              } else {
                Alert("Lỗi", "Hệ thống đã xảy ra lỗi vui lòng thử lại sau")
              }
            } catch (error) {
              console.error("API Error: ", error);
            }
          },
        },
      ]
    );
  };


  const useVoucher = (coupon) => {
    const newTotal = activeAuction[0].money * (1 - coupon.discount);
    setSelectVoucher(coupon);
    setTotal(newTotal)

    const updatedVouchers = vouchers.filter(item => item !== coupon);
    setFilterVouchers(updatedVouchers);
  }


  const formatMoney = (input) => {
    // Kiểm tra nếu input không được định nghĩa hoặc có giá trị là undefined
    if (input === undefined || input === null) {
      return ''; // hoặc giá trị mặc định khác tùy thuộc vào yêu cầu của bạn
    }

    // Kiểm tra nếu input không phải là chuỗi
    if (typeof input !== 'string') {
      // Xử lý input không phải là chuỗi ở đây, ví dụ: 
      input = input.toString(); // Chuyển đổi sang chuỗi
    }

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

            {user.role === "CUSTOMER" ? (
              <View>
                {item.status === "New" ? (
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

                          {activeAuction !== undefined && activeAuction.length !== 0 && (
                            <Text style={styles.text}>
                              Phí vận chuyển: {formatMoney(activeAuction[0].money)}
                            </Text>
                          )}

                          <Text style={styles.text}>
                            Số điện thoại: {item.shipper.phone}
                          </Text>
                          <PhoneCallButton phoneNumber={item.shipper.phone} />
                        </>
                      )}
                    </View>
                  </View>
                )
                }


                {item.status === "Completed" && orderrating == undefined && (
                  <View style={styles.container}>
                    <Text style={styles.title}>Đánh giá:</Text>
                    <Text style={styles.ratingText}>Điểm: {rating}</Text>
                    <View style={styles.starsContainer}>
                      {[1, 2, 3, 4, 5].map((value) => (
                        <TouchableOpacity
                          key={value}
                          style={styles.starButton}
                          onPress={() => handleRating(value)}
                        >
                          <Text style={value <= rating ? styles.filledStar : styles.emptyStar}>★</Text>
                        </TouchableOpacity>
                      ))}
                    </View>
                    <TextInput
                      style={styles.input}
                      placeholder="Nhập nội dung đánh giá"
                      value={comment}
                      onChangeText={handleCommentChange}
                    />

                    <Button filled title="Gửi đánh giá" onPress={handleSubmitRating} disabled={rating === 0} />
                  </View>
                )}


                {item.status === "Completed" ?
                  billOrder == undefined || billOrder === "No data" ? (
                    <>
                      <View>
                        {total !== undefined && (
                          <Text style={styles.textTotal}>
                            Tổng tiền: {formatMoney(total)}
                          </Text>
                        )}

                      </View>
                      <ScrollView horizontal>
                        {filterVouchers.map((coupon, index) => (
                          <View style={styles.couponContainer} key={index}>
                            <Coupon
                              discount={coupon.discount}
                              startDate={coupon.startDate}
                              endDate={coupon.endDate}
                              title={coupon.title}
                              onPressButton={() => useVoucher(coupon)}
                            />
                          </View>
                        ))}
                      </ScrollView>
                      <View className="px-4 space-y-2" style={{ marginHorizontal: 22 }}>

                        <Button
                          title="Thanh toán"
                          filled
                          onPress={() => payment()}
                          disabled={loadingCreateAuction}
                          style={{
                            marginTop: 18,
                            marginBottom: 4,
                          }}
                        />
                      </View>
                    </>

                  ) : (
                    <View className="px-4 space-y-2" style={{ marginHorizontal: 22 }}>
                      <Button
                        title="Đã thanh toán"
                        filled
                        style={{
                          marginTop: 18,
                          marginBottom: 4,
                        }}
                      />
                    </View>
                  ) : (<View></View>)

                }


              </View>
            ) : (

              item.status === 'New' ? (
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
                                placeholder={newAuction.title}
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
                                placeholder={newAuction.content}
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
                                placeholder={newAuction.money}
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
              ) :
                (
                  item.status === "Pending" ? (
                    <View className="px-4 space-y-2">
                      <Button
                        title="Đã giao xong"
                        filled
                        onPress={confirm}
                        style={{
                          marginTop: 18,
                          marginBottom: 4,
                        }}
                      />
                    </View>

                  ) : (
                    <View></View>
                  )
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


          <TouchableOpacity onPress={handlePressShipper} style={{ flexDirection: "row", alignItems: "center", padding: 10 }}>
            <Image
              source={{ uri: selectedItem.shipper.avatar }}
              style={{ width: 50, height: 50, borderRadius: 25 }}
            />
            <View style={{ marginLeft: 10 }}>
              <Text style={{ fontSize: 16, fontWeight: "600" }}>{selectedItem.shipper.first_name} {selectedItem.shipper.last_name}</Text>
              <Text>{selectedItem.content}</Text>
              <Text style={{ marginTop: 5, fontWeight: "600", color: 'red' }}>{formatMoney(selectedItem.money)}</Text>
            </View>
          </TouchableOpacity>



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

  textTotal: {
    fontSize: 20, // Kích thước của chữ
    color: 'red', // Màu của chữ
    fontWeight: '600',
    marginTop: 20,
    marginLeft: 20,
  },
  // Coupon 

  container: {
    borderWidth: 2,
    borderColor: COLORS.primary,
    borderRadius: 10,
    padding: 10,
    margin: 20,
  },
  header: {
    borderBottomWidth: 1,
    borderBottomColor: '#ccc',
    paddingBottom: 10,
    marginBottom: 10,
    alignItems: 'center',
  },
  headerText: {
    textAlign: 'center',
    fontSize: 16,
    fontWeight: 600
  },
  content: {
    fontSize: 16,
  },
  button: {
    backgroundColor: COLORS.primary,
    padding: 10,
    marginTop: 10,
    borderRadius: 5,
  },
  buttonText: {
    color: 'white',
    textAlign: 'center',
  },
  discountText: {
    fontWeight: '600',
    color: '#B9B9B9',
    // Các thuộc tính khác cho văn bản
  },
  dateText: {
    fontWeight: '500',
    color: '#B9B9B9',
    // Các thuộc tính khác cho văn bản
  },

  rowContainer: {
    flexDirection: 'row',
    alignItems: 'center', // Đảm bảo các phần tử nằm cùng một hàng căn giữa theo chiều dọc
    marginBottom: 5, // Thêm khoảng cách giữa các hàng nếu cần
  },
  labelText: {
    fontWeight: '500', // Kiểu cho văn bản label
    marginRight: 5, // Thêm khoảng cách giữa label và ngày
  },

  //Rating
  containerRating: {
    alignItems: 'center',
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  starsContainer: {
    flexDirection: 'row',
  },
  starButton: {
    padding: 5,
  },
  filledStar: {
    color: 'gold',
    fontSize: 24,
  },
  emptyStar: {
    color: 'gray',
    fontSize: 24,
  },
  ratingText: {
    marginTop: 10,
  },
  input: {
    height: 40,
    width: '100%',
    borderRadius: 10,
    borderColor: 'gray',
    borderWidth: 1,
    paddingHorizontal: 10,
    marginTop: 10,
    marginBottom: 10,
  },
});





