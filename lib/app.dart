import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:outflow_v2/services/auth_service.dart';
import 'package:outflow_v2/view/screen/home_screen.dart';
import 'package:outflow_v2/view/screen/login_screen.dart';
import 'package:outflow_v2/view/screen/signup_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffffffff),
            foregroundColor: Color(0xff202020),
            shadowColor: Color(0x00202020),
          )),
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: _authService.isLoggedIn() ? '/' : '/login',
        routes: [
          GoRoute(
            name: 'login',
            path: '/login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            name: 'signup',
            path: '/signup',
            builder: (context, state) => const SignupScreen(),
          ),
          GoRoute(
            name: 'home',
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      ),
    );
  }
}
