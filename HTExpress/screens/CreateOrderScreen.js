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
import * as Permissions from 'expo-permissions';
import { Dropdown } from "react-native-element-dropdown";
import AntDesign from "@expo/vector-icons/AntDesign";
import LoaddingButton from "../components/LoaddingButton";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Picker } from '@react-native-picker/picker';
import { StatusBar } from "expo-status-bar";

const CreateOrderScreen = ({ navigation }) => {

    const [listLocation, setListLocation] = useState();

    const [cities, setCities] = useState([]);
    const [toCities, setToCities] = useState([]);
    const [city, setCity] = useState();
    const [toCity, setToCity] = useState();

    const [districts, setDistricts] = useState([]);
    const [toDistricts, setToDistricts] = useState([]);
    const [district, setDistrict] = useState();
    const [toDistrict, setToDistrict] = useState();

    const [wards, setWards] = useState([]);
    const [toWards, setToWards] = useState([]);



    const [cameraPermission, setCameraPermission] = useState(null);

    const [order, setOrder] = useState({
        title: "",
        content: "",
        fromStreet: "",
        toStreet: "",
        image: "",
        fromWard: "",
        toWard: "",
    });

    //Util
    const [loading, setLoading] = useState(false); // Button
    const [isFocus, setIsFocus] = useState(false); // Dropdown


    const [items, setItems] = useState([
        { label: "Hàng hóa", value: "Hàng hóa" },
        { label: "Đồ ăn", value: "Đồ ăn" },
        { label: "Cồng kềnh", value: "Cồng kềnh" }
    ]);



    useEffect(() => {
        const fetchData = async () => {
            const accessToken = await AsyncStorage.getItem("access-token");
            try {
                const api = authApi(accessToken);

                const res = await api.get(endpoints["ward"], {
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                    },
                });

                setListLocation(res.data);
                setCities(getCitiesFromWards(res.data));
                setToCities(getCitiesFromWards(res.data));
            } catch (error) {
                // Handle errors
                console.error("API Error:", error);
            }

        };

        // Call the async function
        fetchData();
    }, []);



    function getCitiesFromWards(wards) {
        const cities = new Map(); // Sử dụng Map để lưu trữ duy nhất các thành phố
        for (let i = 0; i < wards.length; i++) {
            const ward = wards[i];
            // Kiểm tra xem phường có thông tin về quận và thành phố không
            if (ward && ward.district && ward.district.city) {
                const city = ward.district.city;
                // Thêm thành phố vào Map nếu chưa tồn tại
                if (!cities.has(city.id)) {
                    cities.set(city.id, { id: city.id, name: city.name });
                }
            }
        }
        // Chuyển Map thành mảng và trả về danh sách các thành phố
        return Array.from(cities.values());
    }


    const handleCityChange = async (cityId) => {
        // Filter districts and wards by city ID
        const districts = [];
        const districtIds = new Set();
        listLocation.forEach(item => {
            if (item.district.city.id === cityId && !districtIds.has(item.district.id)) {
                districts.push(item.district);
                districtIds.add(item.district.id);
            }
        });
        setDistricts(districts);
    };

    const handleDistrictChange = async (districtId) => {
        const wards = [];
        const wardIds = new Set();
        listLocation.forEach(item => {
            if (item.district.id === districtId && !wardIds.has(item.id)) {
                wards.push(item);
                wardIds.add(item.id);
            }
        });
        setWards(wards);

    };


    const handleToCityChange = async (cityId) => {
        // Filter districts and wards by city ID
        const districts = [];
        const districtIds = new Set();
        listLocation.forEach(item => {
            if (item.district.city.id === cityId && !districtIds.has(item.district.id)) {
                districts.push(item.district);
                districtIds.add(item.district.id);
            }
        });
        setToDistricts(districts);
    };

    const handleToDistrictChange = async (districtId) => {
        const wards = [];
        const wardIds = new Set();
        listLocation.forEach(item => {
            if (item.district.id === districtId && !wardIds.has(item.id)) {
                wards.push(item);
                wardIds.add(item.id);
            }
        });
        setToWards(wards);
        console.log(wards);

    };




    const requestCameraRollPermission = async () => {
        const { status } = await MediaLibrary.requestPermissionsAsync();

        if (status !== "granted") {
            alert("Permission to access media library is required!");
        }
    };


    const getPermissions = async () => {
        const { status } = await Permissions.askAsync(Permissions.CAMERA, Permissions.MEDIA_LIBRARY);
        setCameraPermission(status === 'granted');
    };



    const pickImage = async () => {
        console.log(cameraPermission);
        if (cameraPermission) {
            let result = await ImagePicker.launchCameraAsync({
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
                    // Assuming 'change' is a function passed as props
                    change("image", result.assets[0]);
                } else {
                    console.log("No assets found");
                }
            }
        } else {
            getPermissions();
        }



    };

    const change = (field, value) => {
        setOrder((current) => {
            return { ...current, [field]: value };
        });
    };




    // Check empty
    const areFieldsEmpty = () => {
        // Check for null or empty values in any of the fields
        if (
            !order.title ||
            !order.content ||
            !order.fromStreet ||
            !order.toStreet ||
            !order.image ||
            !order.fromWard ||
            !order.toWard
        ) {
            // At least one field is null or empty
            return true;
        }
        // Additional specific checks if needed

        // All fields are filled
        return false;
    };

    const create = async () => {
        const isAnyFieldEmpty = areFieldsEmpty();
        const accessToken = await AsyncStorage.getItem("access-token");
        const api = authApi(accessToken);

        if (isAnyFieldEmpty) {
            Alert.alert(
                (title = "Thông báo"),
                (message = "Vui lòng điền đầy đủ thông tin !!!")
            );
        } else {
            

            setLoading(true);

            const form = new FormData();
            for (let key in order)
                if (key === "image") {

                    console.log("Name: " + order[key].name);
                    console.log("File: " + order[key].uri);
                    form.append(key, {
                        uri: order[key].uri,
                        name: order[key].fileName,
                        type: order[key].type,
                    });
                    console.log("Type" + order[key].type);

                } else form.append(key, order[key]);

            try {

                console.log(form);
                let res = await api.post(endpoints["create-order"], form, {
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                    },
                });

                console.log(res);

                if (res.status == 201) {

                    console.log("Create order succesfull")
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
    };

    const handleGoBack = () => {
        navigation.goBack();
      };

    return (
        <SafeAreaView style={{ flex: 1, backgroundColor: COLORS.white }}>
            
            <ScrollView
                contentContainerStyle={{ flexGrow: 1 }}
                keyboardShouldPersistTaps="handled"
            >
                <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
                    <View style={{ flex: 1, marginHorizontal: 22 }}>
                    <View>
      <Button title="Go Back" onPress={handleGoBack} />
    </View>
                        <View style={{ marginVertical: 22 }}>
                            <Text
                                style={{
                                    fontSize: 22,
                                    fontWeight: "bold",
                                    marginVertical: 12,
                                    color: COLORS.black,
                                }}
                            >
                                Tạo đấu giá
                            </Text>

                            <Text
                                style={{
                                    fontSize: 16,
                                    color: COLORS.black,
                                }}
                            >
                                Ưu đãi ngập tràn!
                            </Text>
                        </View>

                        <View style={styles.container}>
                            <TouchableOpacity onPress={() => pickImage()}>
                                <View style={styles.imageContainer}>
                                    {order.image ? (
                                        <Image
                                            source={{ uri: order.image.uri }}
                                            style={styles.orderImage}
                                        />
                                    ) : (
                                        <Text style={styles.avatarText}>Chụp ảnh sản phẩm</Text>
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
                                Loại vận chuyển
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
                                placeholder={!isFocus ? "Chọn loại vận chuyển" : "..."}
                                value={order.title}
                                onFocus={() => setIsFocus(true)}
                                onBlur={() => setIsFocus(false)}
                                onChange={(item) => {
                                    change("title", item.value);
                                    setIsFocus(false);
                                }}
                                renderLeftIcon={() => (
                                    <AntDesign
                                        style={styles.icon}
                                        color={isFocus ? COLORS.secondary : "black"}
                                        name="dropbox"
                                        size={20}
                                    />
                                )}
                            />

                        </View>


                        <View style={{ marginBottom: 12 }}>
                            <Text
                                style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                            >
                                Nội dung hàng hóa
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
                                    value={order.content}
                                    onChangeText={content => change("content", content)}
                                    style={{
                                        width: "100%",
                                    }}
                                />
                            </View>
                        </View>
                        <Text
                            style={{
                                fontSize: 20,
                                fontWeight: 400,
                                marginVertical: 8,
                            }}
                        >
                            Từ
                        </Text>

                        <View style={{ marginBottom: 12 }}>
                            <Text
                                style={{
                                    fontSize: 16,
                                    fontWeight: 400,
                                    marginVertical: 8,
                                }}
                            >
                                Thành phố
                            </Text>
                            <Dropdown
                                style={[
                                    styles.dropdown,

                                ]}
                                placeholderStyle={styles.placeholderStyle}
                                selectedTextStyle={styles.selectedTextStyle}
                                inputSearchStyle={styles.inputSearchStyle}
                                iconStyle={styles.iconStyle}
                                data={cities.map(city => ({ value: city.id, label: city.name }))}
                                maxHeight={300}
                                labelField="label"
                                valueField="value"
                                placeholder={!isFocus ? "Chọn thành phố" : "..."}
                                search={true}
                                searchPlaceholder="Tìm kiếm..."
                                value={city}
                                onChange={(item) => {
                                    handleCityChange(item.value);
                                    setCity(item);
                                }}
                                renderLeftIcon={() => (
                                    <AntDesign
                                        style={styles.icon}
                                        color={"black"}
                                        name="user"
                                        size={20}
                                    />
                                )}
                            />

                        </View>


                        <View style={{ flexDirection: "row", marginBottom: 12 }} >
                            <View style={{ flex: 1, marginRight: 8 }}>
                                <Text
                                    style={{
                                        fontSize: 16,
                                        fontWeight: 400,
                                        marginVertical: 8,
                                    }}
                                >
                                    Quận/Huyện
                                </Text>
                                <Dropdown
                                    style={[
                                        styles.dropdown,

                                    ]}
                                    placeholderStyle={styles.placeholderStyle}
                                    selectedTextStyle={styles.selectedTextStyle}
                                    inputSearchStyle={styles.inputSearchStyle}
                                    iconStyle={styles.iconStyle}
                                    data={districts.map(district => ({ value: district.id, label: district.name }))}
                                    maxHeight={300}
                                    labelField="label"
                                    valueField="value"
                                    placeholder={"Chọn Quận/Huyện"}
                                    search={true}
                                    searchPlaceholder="Tìm kiếm..."
                                    value={district}
                                    onChange={(item) => {
                                        handleDistrictChange(item.value);
                                        setDistrict(item);
                                    }}
                                    renderLeftIcon={() => (
                                        <AntDesign
                                            style={styles.icon}
                                            color={"black"}
                                            name="user"
                                            size={20}
                                        />
                                    )}
                                />
                            </View>

                            <View style={{ flex: 1, marginRight: 8 }}>
                                <Text
                                    style={{
                                        fontSize: 16,
                                        fontWeight: 400,
                                        marginVertical: 8,
                                    }}
                                >
                                    Phường/Xã
                                </Text>
                                <Dropdown
                                    style={[
                                        styles.dropdown,
                                    ]}
                                    placeholderStyle={styles.placeholderStyle}
                                    selectedTextStyle={styles.selectedTextStyle}
                                    inputSearchStyle={styles.inputSearchStyle}
                                    iconStyle={styles.iconStyle}
                                    data={wards.map(ward => ({ value: ward.id, label: ward.name }))}
                                    maxHeight={300}
                                    labelField="label"
                                    valueField="value"
                                    placeholder={"Chọn Phường/Xã"}
                                    search={true}
                                    searchPlaceholder="Tìm kiếm..."
                                    value={order.fromWard}
                                    onChange={(item) => {
                                        change("fromWard", item.value)
                                    }}
                                    renderLeftIcon={() => (
                                        <AntDesign
                                            style={styles.icon}
                                            color={"black"}
                                            name="user"
                                            size={20}
                                        />
                                    )}
                                />
                            </View>

                        </View>

                        <View style={{ marginBottom: 12 }}>
                                <Text
                                    style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                                >
                                    Số nhà, tên đường
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
                                        placeholder="Nhập số nhà, tên đường"
                                        placeholderTextColor={COLORS.black}
                                        value={order.fromStreet}
                                        onChangeText={content => change("fromStreet", content)}
                                        style={{
                                            width: "100%",
                                        }}
                                    />
                                </View>
                            </View>




                        <Text
                            style={{
                                fontSize: 20,
                                fontWeight: 400,
                                marginVertical: 8,
                            }}
                        >
                            Đến
                        </Text>

                        <View style={{ marginBottom: 12 }}>
                            <Text
                                style={{
                                    fontSize: 16,
                                    fontWeight: 400,
                                    marginVertical: 8,
                                }}
                            >
                                Thành phố
                            </Text>
                            <Dropdown
                                style={[
                                    styles.dropdown,

                                ]}
                                placeholderStyle={styles.placeholderStyle}
                                selectedTextStyle={styles.selectedTextStyle}
                                inputSearchStyle={styles.inputSearchStyle}
                                iconStyle={styles.iconStyle}
                                data={toCities.map(city => ({ value: city.id, label: city.name }))}
                                maxHeight={300}
                                labelField="label"
                                valueField="value"
                                placeholder={!isFocus ? "Chọn thành phố" : "..."}
                                search={true}
                                searchPlaceholder="Tìm kiếm..."
                                value={toCity}
                                onChange={(item) => {
                                    handleToCityChange(item.value);
                                    setToCity(item);
                                }}
                                renderLeftIcon={() => (
                                    <AntDesign
                                        style={styles.icon}
                                        color={"black"}
                                        name="user"
                                        size={20}
                                    />
                                )}
                            />

                        </View>


                        <View style={{ flexDirection: "row", marginBottom: 12 }} >
                            <View style={{ flex: 1, marginRight: 8 }}>
                                <Text
                                    style={{
                                        fontSize: 16,
                                        fontWeight: 400,
                                        marginVertical: 8,
                                    }}
                                >
                                    Quận/Huyện
                                </Text>
                                <Dropdown
                                    style={[
                                        styles.dropdown,

                                    ]}
                                    placeholderStyle={styles.placeholderStyle}
                                    selectedTextStyle={styles.selectedTextStyle}
                                    inputSearchStyle={styles.inputSearchStyle}
                                    iconStyle={styles.iconStyle}
                                    data={toDistricts.map(district => ({ value: district.id, label: district.name }))}
                                    maxHeight={300}
                                    labelField="label"
                                    valueField="value"
                                    placeholder={"Chọn Quận/Huyện"}
                                    search={true}
                                    searchPlaceholder="Tìm kiếm..."
                                    value={toDistrict}
                                    onChange={(item) => {
                                        handleToDistrictChange(item.value);
                                        setToDistrict(item);
                                    }}
                                    renderLeftIcon={() => (
                                        <AntDesign
                                            style={styles.icon}
                                            color={"black"}
                                            name="user"
                                            size={20}
                                        />
                                    )}
                                />
                            </View>

                            <View style={{ flex: 1, marginRight: 8 }}>
                                <Text
                                    style={{
                                        fontSize: 16,
                                        fontWeight: 400,
                                        marginVertical: 8,
                                    }}
                                >
                                    Phường/Xã
                                </Text>
                                <Dropdown
                                    style={[
                                        styles.dropdown,
                                    ]}
                                    placeholderStyle={styles.placeholderStyle}
                                    selectedTextStyle={styles.selectedTextStyle}
                                    inputSearchStyle={styles.inputSearchStyle}
                                    iconStyle={styles.iconStyle}
                                    data={toWards.map(ward => ({ value: ward.id, label: ward.name }))}
                                    maxHeight={300}
                                    labelField="label"
                                    valueField="value"
                                    placeholder={"Chọn Phường/Xã"}
                                    search={true}
                                    searchPlaceholder="Tìm kiếm..."
                                    value={order.toWard}
                                    onChange={(item) => {
                                        change("toWard", item.value)
                                    }}
                                    renderLeftIcon={() => (
                                        <AntDesign
                                            style={styles.icon}
                                            color={"black"}
                                            name="user"
                                            size={20}
                                        />
                                    )}
                                />
                            </View>

                        </View>

                        <View style={{ marginBottom: 12 }}>
                                <Text
                                    style={{ fontSize: 16, fontWeight: 400, marginVertical: 8 }}
                                >
                                    Số nhà, tên đường
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
                                        placeholder="Nhập số nhà, tên đường"
                                        placeholderTextColor={COLORS.black}
                                        value={order.toStreet}
                                        onChangeText={content => change("toStreet", content)}
                                        style={{
                                            width: "100%",
                                        }}
                                    />
                                </View>
                            </View>





                        {!loading ? (
                            <Button
                                title="Tạo"
                                filled
                                onPress={create}
                                disabled={loading}
                                style={{
                                    marginTop: 18,
                                    marginBottom: 4,
                                }}
                            />
                        ) : (
                            <LoaddingButton
                                title="Đang tạo"
                                filled
                                disabled={loading}
                                style={{
                                    marginTop: 18,
                                    marginBottom: 4,
                                }}
                            />
                        )}

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
    imageContainer: {
        width: 300,
        height: 300,
        overflow: "hidden",
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "#f0f0f0",
        marginVertical: 10, // Add margin if needed
    },
    orderImage: {
        width: "100%",
        height: "100%",
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

export default CreateOrderScreen;
