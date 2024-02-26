import React, { useState, useContext } from "react";
import {
  View,
  Text,
  Image,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  Dimensions,
  Platform,
} from "react-native";
import { useNavigation } from "@react-navigation/native";
import MyContext from "../configs/MyContext";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";

const UserInfoScreen = ({ navigation }) => {
  const [user, dispatch] = useContext(MyContext);

  console.log(user);
  const logout = () => {
    dispatch({
      type: "logout",
    });
  };
  return (
    <View className="flex-1 relative bg-white" style={styles.boxContent}>
      <SafeAreaView className={ios ? "-mb-8" : ""}>
        <View style={styles.boxRow}>
          <View style={styles.profileContainer}>
            <Image source={{ uri: user.avatar }} style={styles.avatar} />
          </View>
          <View
            style={{
              marginHorizontal: 22,
              marginLeft: 30,
              marginTop: 30,
            }}
          >
            <Text style={styles.textUserName}>
              {user.first_name} {user.last_name}
            </Text>
          </View>
        </View>
        <View style={{ paddingLeft: 20, paddingRight: 15 }}>
          <TouchableOpacity onPress={() => navigation.navigate("Info")}>
            <Text style={styles.text}>Thông tin người dùng </Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={() => navigation.navigate("MyRating")}>
            <Text style={styles.text}>Đánh giá của tôi </Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={() => navigation.navigate("Info")}>
            <Text style={styles.text}>Theo dõi đơn hàng</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={() => navigation.navigate("Info")}>
            <Text style={styles.text}>Đổi mật khẩu </Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.logoutButton} onPress={logout}>
            <Text style={styles.buttonText}>Đăng Xuất</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    </View>
  );
};

const styles = StyleSheet.create({
  boxContent: {
    marginTop: 30,
    marginLeft: 10,
    marginRight: 10,
  },
  boxRow: {
    display: "flex",
    flexDirection: "row",
  },
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    padding: 16,
  },
  profileContainer: {
    alignItems: "center", // To center items horizontally
  },
  avatar: {
    width: 130,
    height: 130,
    borderRadius: 50,
    marginBottom: 16,
  },
  textUserName: {
    fontSize: 30,
    marginBottom: 8,
    fontWeight: "bold",
  },
  text: {
    fontSize: 16,
    fontWeight: "bold",
    marginBottom: 15,
  },
  logoutButton: {
    backgroundColor: "red",
    padding: 10,
    borderRadius: 5,
    marginTop: 16,
  },
  buttonText: {
    color: "white",
    fontSize: 16,
    textAlign: "center",
    fontWeight: "bold",
  },
});

export default UserInfoScreen;
