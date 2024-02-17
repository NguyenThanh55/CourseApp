import {
  View,
  Text,
  Image,
  Pressable,
  TextInput,
  TouchableOpacity,
  TouchableWithoutFeedback,
  ScrollView,
  Keyboard,
  KeyboardAvoidingView,
  StyleSheet,
  Alert,
} from "react-native";
import React, { useState, useContext, useEffect } from "react";
import { SafeAreaView } from "react-native-safe-area-context";
import COLORS from "../constants/colors";
import { Ionicons } from "@expo/vector-icons";
import Button from "../components/Button";
import API, { authApi, endpoints } from "../configs/APIs";
import MyContext from "../configs/MyContext";
import DropDownPicker from "react-native-dropdown-picker";
import * as ImagePicker from "expo-image-picker";
import * as MediaLibrary from "expo-media-library";
import { Dropdown } from "react-native-element-dropdown";
import AntDesign from "@expo/vector-icons/AntDesign";
import LoaddingButton from "../components/LoaddingButton";

const Signup = ({ navigation }) => {
  const [isUsernameValid, setIsUsernameValid] = useState(true);
  const [passwordConfirm, setPasswordConfirm] = useState();
  const [phoneInput, setPhoneInput] = useState();
  const [usernameInput, setusernameInput] = useState();
  const [isEmailValid, setIsEmailValid] = useState(true);
  const [emailInput, setEmailInput] = useState();

  const [user, setUser] = useState({
    first_name: "",
    last_name: "",
    username: "",
    password: "",
    email: "",
    avatar: "",
    role: "CUSTOMER",
    identityCard: null,
    phone: "",
  });

  //Util
  const [isPhoneNumberValid, setIsPhoneNumberValid] = useState(true);
  const [passwordError, setPasswordError] = useState("");
  const [loading, setLoading] = useState(false); // Button
  const [isFocus, setIsFocus] = useState(false); // Dropdown


  const [isPasswordShown, setIsPasswordShown] = useState(false); // Show password
  const [isPasswordConfirmShown, setIsPasswordConfirmShown] = useState(false); // Show confirm password

  const [items, setItems] = useState([
    { label: "Khách hàng", value: "CUSTOMER" },
    { label: "Tài xế", value: "SHIPPER" },
  ]);

  const requestCameraRollPermission = async () => {
    const { status } = await MediaLibrary.requestPermissionsAsync();

    if (status !== "granted") {
      alert("Permission to access media library is required!");
    }
  };

  const pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [1, 1],
      quality: 1,
    });

    if (!result.cancelled) {
      // Check if assets array is present and not empty
      if (result.assets && result.assets.length > 0) {
        console.log(result.assets[0]);
        // setAvatarUri(result.assets[0].uri);
        change("avatar", result.assets[0]);
      } else {
        console.log("No assets found");
      }
    }
  };

  const change = (field, value) => {
    setUser((current) => {
      return { ...current, [field]: value };
    });
  };

  //Check username
  const validateUsername = (inputUsername) => {
    // Check if the username contains spaces
    return !/\s/.test(inputUsername);
  };

  const handleUsernameChange = (u) => {
    setusernameInput(u);
    setIsUsernameValid(true); // Reset validation when the username changes
  };

  const onBlurUsername = () => {
    const isUsernameValid = validateUsername(usernameInput);
    console.log(isUsernameValid);
    if (!isUsernameValid) {
      setIsUsernameValid(false);
    } else {
      change("username", usernameInput);
      setIsUsernameValid(true);
    }
  };

  //Check email
  const validateEmail = (inputEmail) => {
    // Regular expression for a valid email address
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    return emailRegex.test(inputEmail);
  };

  const handleEmailChange = (u) => {
    setEmailInput(u);
    setIsEmailValid(true); // Reset validation when the username changes
  };

  const onBlurEmail = () => {
    const isEmailValid = validateEmail(emailInput);
    console.log(isEmailValid);
    if (!isEmailValid) {
      setIsEmailValid(false);
    } else {
      change("email", emailInput);
      setIsEmailValid(true);
    }
  };

  //Match password
  const handlePasswordConfirmChange = (p) => {
    setPasswordConfirm(p);
    setPasswordError("");
  };

  const checkPasswordMatch = () => {
    if (passwordConfirm !== user.password) {
      setPasswordError("Mật khẩu không khớp.");
    } else {
      setPasswordError("");
    }
  };

  //Check phone number
  const validatePhoneNumber = (inputPhoneNumber) => {
    // Regular expression for a valid Vietnam phone number
    const phoneNumberRegex =
      /^(?:\+84|0)(?:3[2-9]|5[6-9]|7[0|6-9]|8[1-5]|9\d)\d{7}$/;

    return phoneNumberRegex.test(inputPhoneNumber);
  };

  const handlePhoneNumberChange = (p) => {
    setPhoneInput(p);
  };

  const onBlurPhoneNumber = () => {
    const isPhoneNumberValid = validatePhoneNumber(`0` + phoneInput);

    if (!isPhoneNumberValid) {
      setIsPhoneNumberValid(false);
    } else {
      change("phone", `0` + phoneInput);
      setIsPhoneNumberValid(true);
    }
  };

  // Check empty
  const areFieldsEmpty = () => {
    // Check for null or empty values in any of the fields
    if (
      !user.first_name ||
      !user.last_name ||
      !user.username ||
      !user.password ||
      !passwordConfirm ||
      !user.email ||
      !user.phone ||
      !user.role
    ) {
      // At least one field is null or empty
      return true;
    }

    // Additional specific checks if needed

    // All fields are filled
    return false;
  };

  const register = async () => {
    const isAnyFieldEmpty = areFieldsEmpty();

    if (isAnyFieldEmpty) {
      Alert.alert(
        (title = "Thông báo"),
        (message = "Vui lòng điền đầy đủ thông tin !!!")
      );
    } else {
      if (user.role === "SHIPPER" && !user.identityCard) {
        Alert.alert(
          (title = "Thông báo"),
          (message = "Vui lòng nhập căn cước công dân !!!")
        );
      } else {
        setLoading(true);

        const form = new FormData();
        for (let key in user)
          if (key === "avatar") {
            console.log("Name: " + user[key].name);
            console.log("File: " + user[key].uri);
            form.append(key, {
              // uri: user[key].uri,
              // name: "avatar.jpg",
              // type: "image/jpeg",
              uri: user[key].uri,
              name: user[key].fileName,
              type: user[key].type,
            });
            console.log("Type" + user[key].type);
          } else form.append(key, user[key]);

        try {
          console.log(form);
          let res = await API.post(endpoints["register"], form, {
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
          });

          console.log(res.status);

          if (res.status == 201) {
            navigation.navigate("Login");
          } else {
            Alert.alert(
              (title = "Thông báo"),
              (message = "Hệ thống đang có lỗi vui lòng thử lại sau !!!")
            );
          }
        } catch (ex) {
          Alert.alert(
            (title = "Thông báo"),
            (message = "Hệ thống đang có lỗi vui lòng thử lại sau !!!")
          );
          console.error("Error" + ex.message);
        } finally {
          setLoading(false);
        }
      }
    }
  };

  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: COLORS.white }}>
      <ScrollView
        contentContainerStyle={{ flexGrow: 1 }}
        keyboardShouldPersistTaps="handled"
      >
        <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
          <View style={{ flex: 1, marginHorizontal: 22 }}>
            <View style={{ marginVertical: 22 }}>
              <Text
                style={{
                  fontSize: 22,
                  fontWeight: "bold",
                  marginVertical: 12,
                  color: COLORS.black,
                }}
              >
                Tạo tài khoản
              </Text>

              <Text
                style={{
                  fontSize: 16,
                  color: COLORS.black,
                }}
              >
                Sử dụng HTExpress ngay từ hôm nay!
              </Text>
            </View>

            <View style={styles.container}>
              <TouchableOpacity onPress={() => pickImage()}>
                <View style={styles.avatarContainer}>
                  {user.avatar ? (
                    <Image
                      source={{ uri: user.avatar.uri }}
                      style={styles.avatarImage}
                    />
                  ) : (
                    <Text style={styles.avatarText}>Chọn Avatar</Text>
                  )}
                </View>
              </TouchableOpacity>
            </View>

            <View style={{ marginBottom: 12 }}>
              <Text
                style={{
                  fontSize: 16,
                  fontWeight: 400,
                  marginVertical: 8,
                }}
              >
                Loại tài khoản
              </Text>

              <Dropdown
                style={[
                  styles.dropdown,
                  isFocus && { borderColor: COLORS.secondary },
                ]}
                placeholderStyle={styles.placeholderStyle}
                selectedTextStyle={styles.selectedTextStyle}
                inputSearchStyle={styles.inputSearchStyle}
                iconStyle={styles.iconStyle}
                data={items}
                maxHeight={300}
                labelField="label"
                valueField="value"
                placeholder={!isFocus ? "Select item" : "..."}
                searchPlaceholder="Search..."
                value={user.role}
                onFocus={() => setIsFocus(true)}
                onBlur={() => setIsFocus(false)}
                onChange={(item) => {
                  change("role", item.value);
                  setIsFocus(false);
                }}
                renderLeftIcon={() => (
                  <AntDesign
                    style={styles.icon}
                    color={isFocus ? COLORS.secondary : "black"}
                    name="user"
                    size={20}
                  />
                )}
              />

              {user.role === "CUSTOMER" && (
                <View style={{ marginBottom: 12 }} />
              )}
              {user.role === "SHIPPER" && (
                <View style={{ marginBottom: 12 }}>
                  <Text
                    style={{
                      fontSize: 16,
                      fontWeight: 400,
                      marginVertical: 8,
                    }}
                  >
                    Căn cước công dân
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
                      placeholder="Nhập căn cước công dân"
                      placeholderTextColor={COLORS.black}
                      keyboardType="numeric"
                      value={user.identityCard}
                      onChangeText={(u) => change("identityCard", u)}
                      style={{
                        width: "100%",
                      }}
                    />
                  </View>
                </View>
              )}

              <View style={{ flexDirection: "row", marginBottom: 12 }}>
                <View style={{ flex: 1, marginRight: 8 }}>
                  <Text
                    style={{
                      fontSize: 16,
                      fontWeight: "400",
                      marginBottom: 8,
                    }}
                  >
                    Họ
                  </Text>
                  <View
                    style={{
                      width: "100%",
                      height: 48,
                      borderColor: "black", // Assuming COLORS.black is equivalent to 'black'
                      borderWidth: 1,
                      borderRadius: 8,
                      alignItems: "center",
                      justifyContent: "center",
                      paddingLeft: 22,
                    }}
                  >
                    <TextInput
                      placeholder="Nhập họ..."
                      placeholderTextColor="black" // Assuming COLORS.black is equivalent to 'black'
                      value={user.first_name}
                      onChangeText={(text) => change("first_name", text)}
                      style={{
                        width: "100%",
                      }}
                    />
                  </View>
                </View>

                <View style={{ flex: 1, marginLeft: 8 }}>
                  <Text
                    style={{
                      fontSize: 16,
                      fontWeight: "400",
                      marginBottom: 8,
                    }}
                  >
                    Tên
                  </Text>
                  <View
                    style={{
                      width: "100%",
                      height: 48,
                      borderColor: "black", // Assuming COLORS.black is equivalent to 'black'
                      borderWidth: 1,
                      borderRadius: 8,
                      alignItems: "center",
                      justifyContent: "center",
                      paddingLeft: 22,
                    }}
                  >
                    <TextInput
                      placeholder="Nhập tên..."
                      placeholderTextColor="black" // Assuming COLORS.black is equivalent to 'black'
                      value={user.last_name}
                      onChangeText={(text) => change("last_name", text)}
                      style={{
                        width: "100%",
                      }}
                    />
                  </View>
                </View>
              </View>

              <View style={{ marginBottom: 12 }}>
                <Text
                  style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                >
                  Tên tài khoản
                </Text>

                <View
                  style={{
                    width: "100%",
                    height: 48,
                    borderColor: isUsernameValid ? COLORS.black : "red",
                    borderWidth: 1,
                    borderRadius: 8,
                    alignItems: "center",
                    justifyContent: "center",
                    paddingLeft: 22,
                  }}
                >
                  <TextInput
                    placeholder="Nhập tên tài khoản"
                    placeholderTextColor={COLORS.black}
                    value={usernameInput}
                    onChangeText={handleUsernameChange}
                    onBlur={onBlurUsername}
                    style={{
                      width: "100%",
                    }}
                  />
                </View>
                {!isUsernameValid && (
                  <Text style={{ color: "red", marginTop: 4 }}>
                    Tên tài khoản không được chứa khoảng trắng.
                  </Text>
                )}
              </View>

              <View style={{ marginBottom: 12 }}>
                <Text
                  style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                >
                  Email
                </Text>

                <View
                  style={{
                    width: "100%",
                    height: 48,
                    borderColor: isUsernameValid ? COLORS.black : "red",
                    borderWidth: 1,
                    borderRadius: 8,
                    alignItems: "center",
                    justifyContent: "center",
                    paddingLeft: 22,
                  }}
                >
                  <TextInput
                    placeholder="Nhập email"
                    placeholderTextColor={COLORS.black}
                    keyboardType="email-address"
                    value={emailInput}
                    onChangeText={handleEmailChange}
                    onBlur={onBlurEmail}
                    style={{
                      width: "100%",
                    }}
                  />
                </View>
                {!isEmailValid && (
                  <Text style={{ color: "red", marginTop: 4 }}>
                    Email không đúng định dạng
                  </Text>
                )}
              </View>

              <View style={{ marginBottom: 12 }}>
                <Text
                  style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                >
                  Số điện thoại
                </Text>

                <View
                  style={{
                    width: "100%",
                    height: 48,
                    borderColor: isPhoneNumberValid ? COLORS.black : "red",
                    borderWidth: 1,
                    borderRadius: 8,
                    alignItems: "center",
                    flexDirection: "row",
                    justifyContent: "space-between",
                    paddingLeft: 22,
                  }}
                >
                  <TextInput
                    placeholder="+84"
                    placeholderTextColor={COLORS.black}
                    keyboardType="numeric"
                    style={{
                      width: "12%",
                      borderRightWidth: 1,
                      borderLeftColor: COLORS.grey,
                      height: "100%",
                    }}
                  />

                  <TextInput
                    placeholder="Nhập số điện thoại"
                    placeholderTextColor={COLORS.black}
                    keyboardType="numeric"
                    onChangeText={handlePhoneNumberChange}
                    onBlur={onBlurPhoneNumber}
                    value={phoneInput}
                    style={{
                      width: "80%",
                    }}
                  />
                </View>
                {!isPhoneNumberValid && (
                  <Text style={{ color: "red", marginTop: 4 }}>
                    Số điện thoại không hợp lệ.
                  </Text>
                )}
              </View>

              <View style={{ marginBottom: 12 }}>
                <Text
                  style={{
                    fontSize: 16,
                    fontWeight: 400,
                    marginVertical: 8,
                  }}
                >
                  Mật khẩu
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
                    placeholder="Nhập mật khẩu"
                    placeholderTextColor={COLORS.black}
                    secureTextEntry={!isPasswordShown}
                    value={user.password}
                    onChangeText={(p) => change("password", p)}
                    style={{
                      width: "100%",
                    }}
                  />

                  <TouchableOpacity
                    onPress={() => setIsPasswordShown(!isPasswordShown)}
                    style={{
                      position: "absolute",
                      right: 12,
                    }}
                  >
                    {isPasswordShown == true ? (
                      <Ionicons name="eye-off" size={24} color={COLORS.black} />
                    ) : (
                      <Ionicons name="eye" size={24} color={COLORS.black} />
                    )}
                  </TouchableOpacity>
                </View>
              </View>

              <View style={{ marginBottom: 12 }}>
                <Text
                  style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                >
                  Xác nhận mật khẩu
                </Text>

                <View
                  style={{
                    width: "100%",
                    height: 48,
                    borderColor: passwordError ? "red" : COLORS.black,
                    borderWidth: 1,
                    borderRadius: 8,
                    alignItems: "center",
                    justifyContent: "center",
                    paddingLeft: 22,
                  }}
                >
                  <TextInput
                    placeholder="Nhập lại mật khẩu"
                    placeholderTextColor={COLORS.black}
                    secureTextEntry={!isPasswordConfirmShown}
                    value={passwordConfirm}
                    onChangeText={handlePasswordConfirmChange}
                    onBlur={checkPasswordMatch}
                    style={{ width: "100%" }}
                  />

                  <TouchableOpacity
                    onPress={() =>
                      setIsPasswordConfirmShown(!isPasswordConfirmShown)
                    }
                    style={{ position: "absolute", right: 12 }}
                  >
                    {isPasswordConfirmShown == true ? (
                      <Ionicons name="eye-off" size={24} color={COLORS.black} />
                    ) : (
                      <Ionicons name="eye" size={24} color={COLORS.black} />
                    )}
                  </TouchableOpacity>
                </View>
                {passwordError !== "" && (
                  <Text style={{ color: "red", marginTop: 4 }}>
                    {passwordError}
                  </Text>
                )}
              </View>
            </View>

            {!loading ? (
              <Button
                title="Đăng ký"
                filled
                onPress={register}
                disabled={loading}
                style={{
                  marginTop: 18,
                  marginBottom: 4,
                }}
              />
            ) : (
              <LoaddingButton
                title="Đang đăng ký"
                filled
                disabled={loading}
                style={{
                  marginTop: 18,
                  marginBottom: 4,
                }}
              />
            )}

            <View
              style={{
                flexDirection: "row",
                alignItems: "center",
                marginVertical: 20,
              }}
            >
              <View
                style={{
                  flex: 1,
                  height: 1,
                  backgroundColor: COLORS.grey,
                  marginHorizontal: 10,
                }}
              />
              <Text style={{ fontSize: 14 }}>Đăng ký với</Text>
              <View
                style={{
                  flex: 1,
                  height: 1,
                  backgroundColor: COLORS.grey,
                  marginHorizontal: 10,
                }}
              />
            </View>

            <View
              style={{
                flexDirection: "row",
                justifyContent: "center",
              }}
            >
              <TouchableOpacity
                onPress={() => console.log("Pressed")}
                style={{
                  flex: 1,
                  alignItems: "center",
                  justifyContent: "center",
                  flexDirection: "row",
                  height: 52,
                  borderWidth: 1,
                  borderColor: COLORS.grey,
                  marginRight: 4,
                  borderRadius: 10,
                }}
              >
                <Image
                  source={require("../assets/icons/facebook.png")}
                  style={{
                    height: 36,
                    width: 36,
                    marginRight: 8,
                  }}
                  resizeMode="contain"
                />

                <Text>Facebook</Text>
              </TouchableOpacity>

              <TouchableOpacity
                onPress={() => console.log("Pressed")}
                style={{
                  flex: 1,
                  alignItems: "center",
                  justifyContent: "center",
                  flexDirection: "row",
                  height: 52,
                  borderWidth: 1,
                  borderColor: COLORS.grey,
                  marginRight: 4,
                  borderRadius: 10,
                }}
              >
                <Image
                  source={require("../assets/icons/google.png")}
                  style={{
                    height: 36,
                    width: 36,
                    marginRight: 8,
                  }}
                  resizeMode="contain"
                />

                <Text>Google</Text>
              </TouchableOpacity>
            </View>

            <View
              style={{
                flexDirection: "row",
                justifyContent: "center",
                marginVertical: 22,
              }}
            >
              <Text style={{ fontSize: 16, color: COLORS.black }}>
                Bạn đã có tài khoản?
              </Text>
              <Pressable onPress={() => navigation.navigate("Login")}>
                <Text
                  style={{
                    fontSize: 16,
                    color: COLORS.primary,
                    fontWeight: "bold",
                    marginLeft: 6,
                  }}
                >
                  Đăng nhập
                </Text>
              </Pressable>
            </View>

            <View style={{ marginBottom: 300 }} />
          </View>
        </TouchableWithoutFeedback>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  //Avatar
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  avatarContainer: {
    width: 120,
    height: 120,
    borderRadius: 60,
    overflow: "hidden",
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#f0f0f0",
    marginVertical: 10, // Add margin if needed
  },
  avatarImage: {
    width: "100%",
    height: "100%",
    borderRadius: 60,
  },

  //Dropdown
  dropdown: {
    height: 50,
    borderColor: COLORS.black,
    borderWidth: 0.5,
    borderWidth: 1,
    borderRadius: 8,
    paddingHorizontal: 8,
    paddingLeft: 14,
  },
  icon: {
    marginRight: 5,
  },
  label: {
    position: "absolute",
    backgroundColor: "white",
    left: 22,
    top: 8,
    zIndex: 999,
    paddingHorizontal: 8,
    fontSize: 14,
  },
  placeholderStyle: {
    fontSize: 16,
  },
  selectedTextStyle: {
    fontSize: 16,
  },
  iconStyle: {
    width: 20,
    height: 20,
  },
  inputSearchStyle: {
    height: 40,
    fontSize: 16,
  },
});

export default Signup;
