import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(),
        body: Container(
          color: Colors.black,
        ),
      ),
    );
  }
}
