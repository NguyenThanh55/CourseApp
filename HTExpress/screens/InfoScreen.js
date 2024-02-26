import React, { useState, useContext } from "react";
import {
  View,
  Text,
  Image,
  TouchableOpacity,
  StyleSheet,
  Dimensions,
  Platform,
} from "react-native";
import { useNavigation } from "@react-navigation/native";
import { SafeAreaView } from "react-native-safe-area-context";
import COLORS from "../constants/colors";
import MyContext from "../configs/MyContext";
import { StatusBar } from "expo-status-bar";

const { width, height } = Dimensions.get("window");
const ios = Platform.OS == "ios";
const InfoScreen = () => {
  const [user, dispatch] = useContext(MyContext);

  const navigation = useNavigation();
  console.log(user);
  const logout = () => {
    dispatch({
      type: "logout",
    });
  };
  return (
    <View>
      <StatusBar style="light" />
      <SafeAreaView style={{ flex: 1, backgroundColor: COLORS.white }}>
        <View>
          <Text>Info</Text>
        </View>
      </SafeAreaView>
    </View>
  );
};

export default InfoScreen;
