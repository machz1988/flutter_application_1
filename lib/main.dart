import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class Post{
  String body = '';
  String author = '';
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost(){
    userLiked = !userLiked;
    if (userLiked){
      likes += 1;
    } else{
      likes -= 1;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uandá',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade500),),
      home: MyHomePage(),
    );
  }
}

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

class CommentInputWidget extends StatefulWidget {
  final Function(String) callback;
  const CommentInputWidget(this.callback, {super.key});
  @override
  State<CommentInputWidget> createState() => _CommentInputWidgetState();
}

class _CommentInputWidgetState extends State<CommentInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
  }

  void click(){
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return 
      TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.message), 
          labelText: 'Type a comment',
          suffixIcon: IconButton(
            onPressed: click,
            splashColor: Colors.blue, 
            tooltip: 'Post Comment',
            icon: Icon(Icons.send))),);
  }
}

class PostList extends StatefulWidget {
  final List<Post> listItems;
  const PostList(this.listItems, {super.key});
  @override
  State<PostList> createState() =>  _PostListState();
}

class  _PostListState extends State<PostList> {
  void like(Function callback){
    setState(() {
      callback();
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index){
        var post = widget.listItems[index];
        return Card(child: Row(children: <Widget>[
          Expanded(child: ListTile(title: Text(post.body), subtitle: Text(post.author),)),
          Row(children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0, 0, 10, 0), child: Text(post.likes.toString(), style: TextStyle(fontSize: 20)), ),
            IconButton(onPressed: () => like(post.likePost), icon: Icon(Icons.thumb_up), color: post.userLiked ? Colors.green : Colors.black,)],)],),);          
      },);
  }
}