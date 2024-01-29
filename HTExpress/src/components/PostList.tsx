import React, { Component } from "react";
import { StyleSheet, View, ScrollView, Text, Image } from "react-native";
import { FontAwesomeIcon } from '@fortawesome/react-native-fontawesome'

class PostList extends Component {
  state = {
    posts: [],
  };

// componentDidMount() {
//     // Lấy dữ liệu bài đăng từ API
//     this.fetchPosts();
//   }

//   fetchPosts() {
//     // ...
//   }
constructor(props) {
    super(props);
    this.state.posts = [
      {
        username: "John Doe",
        content: "Hôm nay trời đẹp quá!",
        avatar: "https://avatars.githubusercontent.com/u/12345678?v=4",
      },
      {
        username: "Jane Doe",
        content: "Chúc mọi người một ngày tốt lành!",
        avatar: "https://avatars.githubusercontent.com/u/98765432?v=4",
      },
      {
        username: "Peter Parker",
        content: "Tôi là Spider-Man!",
        avatar: "https://avatars.githubusercontent.com/u/7654321?v=4",
      },
    ];
  }

  

  renderPost = (post) => {
    // Render một thẻ `Post` cho mỗi bài đăng
    return (
        <View style={styles.post}>
        <Image
          style={styles.avatar}
          source={{ uri: post.avatar }}
        />
        <View style={styles.content}>
          <Text style={styles.username}>{post.username}</Text>
          <Text style={styles.content}>{post.content}</Text>
          <FontAwesomeIcon icon="fa-regular fa-flux-capacitor" />
        </View>
      </View>
    );
  };

  render() {
    return (
      <View style={styles.container}>
        <ScrollView>
          {this.state.posts.map((post) => this.renderPost(post))}
        </ScrollView>
      </View>
    )
  }
}

const styles = StyleSheet.create({
    container: {
      flex: 1,
      alignItems: "center",
      justifyContent: "center",
    },
    post: {
      width: "100%",
      height: 100,
      borderRadius: 10,
      backgroundColor: "#fff",
    },
    avatar: {
      width: 50,
      height: 50,
      borderRadius: 50 / 2,
    },
    username: {
      fontSize: 16,
      fontWeight: "bold",
    },
    content: {
      fontSize: 14,
    },
    commentIcon: {
      position: "absolute",
      right: 10,
      top: 10,
    },
  });

export default PostList;