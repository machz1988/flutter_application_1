import 'package:flutter/material.dart';
import 'post.dart';
import 'post_list.dart';
import 'comment_input_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text){
    setState(() {
      posts.add(Post(text, 'Manny'));
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Hello World!"),),
      body: Column(children: <Widget>[
        Expanded(child: PostList(posts)),
        CommentInputWidget(newPost)],)
    );
  }
}


