import 'package:doctor_consultation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/theme.dart';
import 'providers/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:doctor_consultation/Screens/login/login.dart';
import 'package:doctor_consultation/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
          builder: (context,theme, snapshot) {
            return MaterialApp(
              title: 'Doctor Consultant',
              debugShowCheckedModeBanner: false,
              theme: themeData(context),
              darkTheme: darkThemeData(context),
              themeMode: theme.isLightTheme ?  ThemeMode.dark:ThemeMode.light ,
              
              home: LoginScreen(),
            );
          }
      ),
    );
  }
}
