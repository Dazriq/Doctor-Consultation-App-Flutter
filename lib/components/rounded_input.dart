import 'package:flutter/material.dart';
import 'package:doctor_consultation/components/input_container.dart';
import 'package:doctor_consultation/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint
  }) : super(key: key);

  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.9),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 5.0),
          ),
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
          
        ),
      ));
  }
}