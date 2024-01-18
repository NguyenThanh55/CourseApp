import React, { Component } from "react";
import { StyleSheet, View, Text, TextInput, Button } from "react-native";

class PostComposer extends Component {
  state = {
    content: "",
  };
  

  onTextChange = (event) => {
    this.setState({
      content: event.nativeEvent.text,
    });
  };

  onSubmit = () => {
    // Thực hiện việc đăng bài
  };

  render() {
    return (
      <View style={styles.container}>
        <Button
          style={styles.button}
          onPress={this.onSubmit}
          title="Đăng"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  input: {
    width: 200,
    height: 40,
    borderColor: "#ccc",
    borderWidth: 1,
  },
  button: {
    width: 100,
    height: 40,
    backgroundColor: "#000",
    color: "#fff",
  },
});

export default PostComposer;