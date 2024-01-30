import { View, Text, Image, Pressable, TextInput, TouchableOpacity, TouchableWithoutFeedback, ScrollView, Keyboard, } from 'react-native'
import React, { useState, useContext } from 'react'
import { SafeAreaView } from "react-native-safe-area-context";
import COLORS from '../constants/colors';
import { Ionicons } from "@expo/vector-icons";
import Button from '../components/Button';
import MyContext from "../configs/MyContext";

const Signup = ({ navigation }) => {
    const [username, setUsername] = useState();
    const [phoneNumber, setPhoneNumbere] = useState();
    const [password, setPassword] = useState();
    const [passwordConfirm, setPasswordConfirm] = useState();
    const [loading, setLoading] = useState(false);
    const [user, dispatch] = useContext(MyContext);

    const [isPasswordShown, setIsPasswordShown] = useState(false);
    const [isPasswordConfirmShown, setIsPasswordConfirmShown] = useState(false);


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
                                Tạo tài khoản
                            </Text>

                            <Text style={{
                                fontSize: 16,
                                color: COLORS.black
                            }}>Sử dụng HTExpress ngay từ hôm nay!</Text>
                        </View>

                        <View style={{ marginBottom: 12 }}>
                            <Text style={{
                                fontSize: 16,
                                fontWeight: 400,
                                marginVertical: 8
                            }}>Tên tài khoản</Text>

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
                                    placeholder='Nhập tên tài khoản'
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
                            }}>Số điện thoại</Text>

                            <View style={{
                                width: "100%",
                                height: 48,
                                borderColor: COLORS.black,
                                borderWidth: 1,
                                borderRadius: 8,
                                alignItems: "center",
                                flexDirection: "row",
                                justifyContent: "space-between",
                                paddingLeft: 22
                            }}>
                                <TextInput
                                    placeholder='+84'
                                    placeholderTextColor={COLORS.black}
                                    keyboardType='numeric'
                                    value={phoneNumber}
                                    onChangeText={(p) => setPhoneNumbere(p)}
                                    style={{
                                        width: "12%",
                                        borderRightWidth: 1,
                                        borderLeftColor: COLORS.grey,
                                        height: "100%"
                                    }}
                                />

                                <TextInput
                                    placeholder='Nhập số điện thoại'
                                    placeholderTextColor={COLORS.black}
                                    keyboardType='numeric'
                                    style={{
                                        width: "80%"
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

                        <View style={{ marginBottom: 12 }}>
                            <Text style={{
                                fontSize: 16,
                                fontWeight: 400,
                                marginVertical: 8
                            }}>Xác nhận mật khẩu</Text>

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
                                    placeholder='Nhập lại mật khẩu'
                                    placeholderTextColor={COLORS.black}
                                    secureTextEntry={isPasswordShown}
                                    value={passwordConfirm}
                                    onChangeText={(p) => setPasswordConfirm(p)}
                                    style={{
                                        width: "100%"
                                    }}
                                />

                                <TouchableOpacity
                                    onPress={() => setIsPasswordConfirmShown(!isPasswordConfirmShown)}
                                    style={{
                                        position: "absolute",
                                        right: 12
                                    }}
                                >
                                    {
                                        isPasswordConfirmShown == true ? (
                                            <Ionicons name="eye-off" size={24} color={COLORS.black} />
                                        ) : (
                                            <Ionicons name="eye" size={24} color={COLORS.black} />
                                        )
                                    }

                                </TouchableOpacity>
                            </View>
                        </View>




                        <Button
                            title="Sign Up"
                            filled
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
                            <Text style={{ fontSize: 14 }}>Or Sign up with</Text>
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
                            <Text style={{ fontSize: 16, color: COLORS.black }}>Already have an account</Text>
                            <Pressable
                                onPress={() => navigation.navigate("Login")}
                            >
                                <Text style={{
                                    fontSize: 16,
                                    color: COLORS.primary,
                                    fontWeight: "bold",
                                    marginLeft: 6
                                }}>Login</Text>
                            </Pressable>
                        </View>
                    </View>
                </TouchableWithoutFeedback>
            </ScrollView>
        </SafeAreaView>
    )
}

export default Signup