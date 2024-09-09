import 'package:flutter/material.dart';
import 'package:p1_donut_app_javier_martinez/utils/MyTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //donut tab
    const MyTab(iconPath: 'lib/icons/donut.png'),
    //burguer tab
    const MyTab(iconPath: 'lib/icons/donut.png'),
    //smothie tab
    const MyTab(iconPath: 'lib/icons/donut.png'),
    //pancake tab
    const MyTab(iconPath: 'lib/icons/donut.png'),
    //pizza tab
    const MyTab(iconPath: 'lib/icons/donut.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
            //Texto: I want to eat
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 24)),
                  Text("Eat",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            //Tab bar
            TabBar(tabs: myTabs)

            //Tab bar view

            //Total del carrito
          ],
        ),
      ),
    );
  }
}
