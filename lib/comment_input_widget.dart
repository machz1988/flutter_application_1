import 'package:flutter/material.dart';

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
    FocusScope.of(context).unfocus();
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
