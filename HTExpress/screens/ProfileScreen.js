import React, { useState, useContext } from 'react'
import { View, Text, Image, TouchableOpacity, StyleSheet, SafeAreaView } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import MyContext from "../configs/MyContext";

const UserInfoScreen = () => {

const [user, dispatch] = useContext(MyContext);

  const navigation = useNavigation();

  const logout = () => {
    dispatch({
        "type": "logout"
    })
}
  return (
    <View className="flex-1 relative bg-white">
        <SafeAreaView>
        <Image source={{ uri: user.avatar }} style={styles.avatar} />
      <Text style={styles.text}>Tên: {user.first_name} {user.last_name}</Text>
      <Text style={styles.text}>Email: {user.email}</Text>
      <Text style={styles.text}>Số điện thoại: {user.phone}</Text>
      <Text style={styles.text}>Tên tài khoản: {user.username}</Text>
      <TouchableOpacity style={styles.logoutButton} onPress={logout}>
        <Text style={styles.buttonText}>Đăng Xuất</Text>
      </TouchableOpacity>
        </SafeAreaView>
      
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 16,
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
  logoutButton: {
    backgroundColor: 'red',
    padding: 10,
    borderRadius: 5,
    marginTop: 16,
  },
  buttonText: {
    color: 'white',
    fontSize: 16,
    textAlign: 'center',
  },
});

export default UserInfoScreen;
