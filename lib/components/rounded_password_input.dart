import 'package:flutter/material.dart';
import 'package:doctor_consultation/components/input_container.dart';
import 'package:doctor_consultation/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.9),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 5.0),
          ),
          icon: Icon(Icons.lock, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
