import AsyncStorage from "@react-native-async-storage/async-storage";
import { useContext, useState } from "react";
import { View, Text, TextInput, Touchable, TouchableOpacity, ActivityIndicator, Image, Pressable, TouchableWithoutFeedback, ScrollView, Keyboard, } from "react-native";
import API, { authApi, endpoints } from "../configs/APIs";
import { SafeAreaView } from "react-native-safe-area-context";
import MyContext from "../configs/MyContext";
import MyStyles from "../styles/MyStyles";
import COLORS from '../constants/colors';
import { Ionicons } from "@expo/vector-icons";
import Signup from './SingUpScreen';
import Button from '../components/Button';

const Login = ({ navigation }) => {
  const [username, setUsername] = useState();
  const [password, setPassword] = useState();
  const [loading, setLoading] = useState(false);
  const [user, dispatch] = useContext(MyContext);

  const [isPasswordShown, setIsPasswordShown] = useState(false);



  const login = async () => {
    setLoading(true);

    try {
      console.log(username);
      console.log(password);

      // let res = await API.post(endpoints['login'], {
      //   "username": username,
      //   "password": password,
      // });
      // console.log(res.data);
      // await AsyncStorage.setItem("access-token", res.data.access_token)
      // let user = await authApi(res.data.access_token).get(endpoints['current-user']);
      // dispatch({
      //   type: "login",
      //   payload: user.data
      // });
      navigation.navigate("Home");
    } catch (ex) {
      console.error(ex.message);
    } finally {
      setLoading(false);
    }
  }

  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: COLORS.white }}>
            <ScrollView contentContainerStyle={{ flexGrow: 1 }} keyboardShouldPersistTaps="handled">
                <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
      <View style={{ flex: 1, marginHorizontal: 22 }}>
        <View style={{ marginVertical: 22 }}>
          <Text style={{
            fontSize: 22,
            fontWeight: 'bold',
            marginVertical: 12,
            color: COLORS.black
          }}>
            Xin chào ! 👋
          </Text>

          <Text style={{
            fontSize: 16,
            color: COLORS.black
          }}>Lâu rồi không gặp!</Text>
        </View>

        <View style={{ marginBottom: 12 }}>
          <Text style={{
            fontSize: 16,
            fontWeight: 400,
            marginVertical: 8,
          }}>Tài khoản</Text>

          <View style={{
            width: "100%",
            height: 48,
            borderColor: COLORS.black,
            borderWidth: 1,
            borderRadius: 8,
            alignItems: "center",
            justifyContent: "center",
            paddingLeft: 22
          }}>
            <TextInput
              placeholder='Nhập tài khoản'
              placeholderTextColor={COLORS.black}
              keyboardType='text'
              value={username}
              onChangeText={(u) => setUsername(u)}
              style={{
                width: "100%"
              }}
            />
          </View>
        </View>

        <View style={{ marginBottom: 12 }}>
          <Text style={{
            fontSize: 16,
            fontWeight: 400,
            marginVertical: 8
          }}>Mật khẩu</Text>

          <View style={{
            width: "100%",
            height: 48,
            borderColor: COLORS.black,
            borderWidth: 1,
            borderRadius: 8,
            alignItems: "center",
            justifyContent: "center",
            paddingLeft: 22
          }}>
            <TextInput
              placeholder='Nhập mật khẩu'
              placeholderTextColor={COLORS.black}
              secureTextEntry={isPasswordShown}
              value={password}
              onChangeText={(p) => setPassword(p)}

              style={{
                width: "100%"
              }}
            />

            <TouchableOpacity
              onPress={() => setIsPasswordShown(!isPasswordShown)}
              style={{
                position: "absolute",
                right: 12
              }}
            >
              {
                isPasswordShown == true ? (
                  <Ionicons name="eye-off" size={24} color={COLORS.black} />
                ) : (
                  <Ionicons name="eye" size={24} color={COLORS.black} />
                )
              }

            </TouchableOpacity>
          </View>
        </View>


        <Button
          title="Đăng nhập"
          filled
          onPress={login}
        disabled={loading}
          style={{
            marginTop: 18,
            marginBottom: 4,
          }}
        />

        <View style={{ flexDirection: 'row', alignItems: 'center', marginVertical: 20 }}>
          <View
            style={{
              flex: 1,
              height: 1,
              backgroundColor: COLORS.grey,
              marginHorizontal: 10
            }}
          />
          <Text style={{ fontSize: 14 }}>Đằng nhập với</Text>
          <View
            style={{
              flex: 1,
              height: 1,
              backgroundColor: COLORS.grey,
              marginHorizontal: 10
            }}
          />
        </View>

        <View style={{
          flexDirection: 'row',
          justifyContent: 'center'
        }}>
          <TouchableOpacity
            onPress={() => console.log("Pressed")}
            style={{
              flex: 1,
              alignItems: 'center',
              justifyContent: 'center',
              flexDirection: 'row',
              height: 52,
              borderWidth: 1,
              borderColor: COLORS.grey,
              marginRight: 4,
              borderRadius: 10
            }}
          >
            <Image
              source={require("../assets/icons/facebook.png")}
              style={{
                height: 36,
                width: 36,
                marginRight: 8
              }}
              resizeMode='contain'
            />

            <Text>Facebook</Text>
          </TouchableOpacity>

          <TouchableOpacity
            onPress={() => console.log("Pressed")}
            style={{
              flex: 1,
              alignItems: 'center',
              justifyContent: 'center',
              flexDirection: 'row',
              height: 52,
              borderWidth: 1,
              borderColor: COLORS.grey,
              marginRight: 4,
              borderRadius: 10
            }}
          >
            <Image
              source={require("../assets/icons/google.png")}
              style={{
                height: 36,
                width: 36,
                marginRight: 8
              }}
              resizeMode='contain'
            />

            <Text>Google</Text>
          </TouchableOpacity>
        </View>

        <View style={{
          flexDirection: "row",
          justifyContent: "center",
          marginVertical: 22
        }}>
          <Text style={{ fontSize: 16, color: COLORS.black }}>Bạn chưa có mật khẩu?</Text>
          <Pressable
            onPress={() => navigation.navigate("Signup")}
          >
            <Text style={{
              fontSize: 16,
              color: COLORS.primary,
              fontWeight: "bold",
              marginLeft: 6
            }}>Đăng ký</Text>
          </Pressable>
        </View>
      </View>
      </TouchableWithoutFeedback>
      </ScrollView>
    </SafeAreaView>
  );
}

export default Login;