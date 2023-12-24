import 'package:flutter/material.dart';
import 'package:outflow_v2/handler/auth_handler.dart';
import 'package:outflow_v2/view/screen/home_screen.dart';
import 'package:outflow_v2/view/screen/login_screen.dart';
import 'package:outflow_v2/view/screen/signup_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffffffff),
            foregroundColor: Color(0xff202020),
            shadowColor: Color(0x00202020),
          )),
      debugShowCheckedModeBanner: false,
      home: AuthHandler(),
      routes: {
        'home': (context) => const HomeScreen(),
        'login': (context) => const LoginScreen(),
        'signup': (context) => const SignupScreen(),
      },
    );
  }
}
