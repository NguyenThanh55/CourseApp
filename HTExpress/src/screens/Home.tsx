import React, { useState } from 'react';
import { style } from './../style/global';
import { View, Text, TextInput, Button, ScrollView, StyleSheet, SafeAreaView } from 'react-native';
import PostComposer from './../components/PostComposer';
import PostList from './../components/PostList';

const Home = () => {


  return (
    <SafeAreaView style={{ flex: 1 }}>
    <ScrollView>
      <PostComposer />
      <PostList />
    </ScrollView>
  </SafeAreaView>
  );
};





export default Home;