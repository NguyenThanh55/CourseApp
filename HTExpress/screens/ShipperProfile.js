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
  StyleSheet,
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
const ShipperProfile = ({ route }) => {
  const { shipper } = route.params;
  const [activeCategory, setActiveCategory] = useState(1);
  const [listRating, setListRating] = useState(null);
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
      let res = await api.get(endpoints["rating-shipper"](shipper.id));
      if (res.data !== "No data") {
        setListRating(res.data);
      }
    } catch (error) {
      // Handle errors
      console.error("API Error:", error);
    }
  };

  return (
    <SafeAreaView className="space-y-4 flex-1">
      <View style={styles.container}>
        <Image source={{ uri: shipper.avatar }} style={styles.avatar} />
        <View style={styles.infoContainer}>
          <Text style={styles.name}>
            {shipper.first_name} {shipper.last_name}
          </Text>
          <Text style={styles.email}>Email: {shipper.email}</Text>
          <Text style={styles.phone}>Số điện thoại: {shipper.phone}</Text>
          <Text style={styles.identityCard}>
            Căn cước công dân: {shipper.identityCard}
          </Text>
        </View>
      </View>
      <View>
        <Text style={styles.title}>Đánh giá cộng đồng</Text>
        <View>
          <ScrollView className="mb-40">
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
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    alignItems: "center",
    padding: 10,
    borderBottomWidth: 1,
    borderBottomColor: "#ccc",
  },
  title: {
    fontSize: 18,
    fontWeight: "bold",
    marginLeft: 10,
  },
  avatar: {
    width: 80,
    height: 80,
    borderRadius: 40,
    marginRight: 10,
  },
  infoContainer: {
    flex: 1,
  },
  name: {
    fontSize: 18,
    fontWeight: "bold",
  },
  email: {
    fontSize: 16,
    color: "gray",
  },
  phone: {
    fontSize: 16,
  },
  identityCard: {
    fontSize: 16,
  },
  approved: {
    fontSize: 16,
    color: "green",
  },
  pending: {
    fontSize: 16,
    color: "orange",
  },
});

export default ShipperProfile;
