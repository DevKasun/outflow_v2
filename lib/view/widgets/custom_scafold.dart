import 'package:flutter/material.dart';

class CustomScafold extends StatelessWidget {
  final bool hasDrawer;
  final String title;
  final bool showAppBar;
  final Widget body;

  const CustomScafold({
    Key? key,
    required this.body,
    this.hasDrawer = false,
    required this.title,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: hasDrawer ? const Drawer() : null,
        appBar: showAppBar
            ? AppBar(
                actions: const [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                ],
                elevation: 3.0,
                centerTitle: true,
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                backgroundColor: Colors.purple,
              )
            : null,
        body: body,
      ),
    );
  }
}
