import 'package:flutter/material.dart';
import 'my_home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World!"),),
      body: Body()
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = '';
  TextEditingController controller = TextEditingController();
  
  void click(){
    name = controller.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center, 
      child: Padding(
        padding: EdgeInsets.all(10), 
        child: TextField(controller: controller, decoration: InputDecoration(
          prefixIcon: Icon(Icons.person), 
          labelText: 'Type your name',
          border: OutlineInputBorder(borderSide: BorderSide(width: 5, color: Colors.black)),
          suffixIcon: IconButton(
            onPressed: click,
            splashColor: Colors.blue, 
            tooltip: 'Submit',
            icon: Icon(Icons.done))),),),);
  }
}