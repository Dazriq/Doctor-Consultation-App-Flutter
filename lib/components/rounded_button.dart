import 'package:flutter/material.dart';
import 'package:doctor_consultation/constants.dart';
import 'package:doctor_consultation/views/home.dart';
import 'package:doctor_consultation/Screens/login/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (this.title == 'LOGIN') {
      return InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
                
              ));
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kPrimaryColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          Fluttertoast.showToast(
              msg: "ACCOUNT CREATED !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 25.0);
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kPrimaryColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }
  }
}
