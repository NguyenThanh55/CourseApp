import React, { useState, useEffect } from 'react';
import { View, Text, Dimensions, SafeAreaView} from 'react-native';
import HTML from 'react-native-render-html';
import { HTMLElementModel } from 'react-native-render-html';
import API, { authApi, endpoints } from "../configs/APIs";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { WebView } from 'react-native-webview';
import { StatusBar } from "expo-status-bar";
import Button from "../components/Button";
import { useNavigation } from "@react-navigation/native";

export default function CheckOutScreen(props) {
    const [htmlContent, setHtmlContent] = useState('');
    const item = props.route.params;
    const windowWidth = Dimensions.get('window').width;
    const navigation = useNavigation();


    useEffect(() => {
        console.log("useEffect called");        // Function to fetch HTML content from API
        const fetchHtmlContent = async () => {
            console.log("fetchHtmlContent called");
            const accessToken = await AsyncStorage.getItem("access-token");
            try {
                const api = authApi(accessToken);
                const id = item.id;
                const response = await api.get(`/order/` + id + `/checkout/`);

                console.log(`/order/` + id + `/checkout/`);

                setHtmlContent(response.data);

            } catch (error) {
                // Handle errors
                console.error("API Error:", error);
            }
        };

        fetchHtmlContent();
    }, []);

    return (
      <View style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <View style={{ flex: 1, flexDirection: 'column', justifyContent: 'space-between' }}>
          <WebView
            originWhitelist={['*']}
            source={{ html: htmlContent }}
            style={{ width: windowWidth, flex: 1 }}
          />
          <View className="px-4 space-y-2">
                      <Button
                        title="Quay lại đơn hàng"
                        filled
                        onPress={() => navigation.goBack()}
                        style={{
                          marginTop: 18,
                          marginBottom: 4,
                        }}
                      />
                    </View>
        </View>
      </SafeAreaView>
    </View>
    );
};



