import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
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
  String text = '';

  void changeText(String text){
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Hello World!"),),
      body: Column(children: <Widget>[ComentInputWidget(changeText), Text(text)],)
    );
  }
}

class ComentInputWidget extends StatefulWidget {
  final Function(String) callback;
  const ComentInputWidget(this.callback, {super.key});
  @override
  State<ComentInputWidget> createState() => _ComentInputWidgetState();
}

class _ComentInputWidgetState extends State<ComentInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
  }

  void click(){
    widget.callback(controller.text);
    controller.clear();
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