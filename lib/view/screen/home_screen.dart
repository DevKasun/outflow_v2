import 'package:flutter/material.dart';
import 'package:outflow_v2/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("Home Sccreen"),
            getSignOutButton(),
          ],
        ),
      ),
    );
  }

  Widget getSignOutButton() {
    return ElevatedButton(
      onPressed: _signOut,
      child: const Text("Sign out"),
    );
  }

  _signOut() async {
    await AuthService().signOut();
  }
}
