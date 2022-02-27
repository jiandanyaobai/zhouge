import 'package:flutter/material.dart';


class ComplexTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
        )
      ),
    );

  }
}
