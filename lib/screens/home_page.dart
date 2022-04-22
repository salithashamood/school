import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return const Scaffold(
    //   body: Center(
    //     child: Text('Home Page'),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [Text('Waste Management'), Icon(Icons.search),],
        // ),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Hotel Bentota'),
        actions: [
          Image.asset('assets/images/filter_icon.png'),
        ],
        leading: Image.asset('assets/images/hamburger_icon.png'),
      ),
    );
  }
}
