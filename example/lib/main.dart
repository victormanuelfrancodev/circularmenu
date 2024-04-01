import 'package:flutter/material.dart';
import 'package:orbitmenu/animated_orbit_menu.dart';
import 'package:orbitmenu/item.dart';
import 'package:orbitmenu/orbit_menu_config.dart';
import 'package:orbitmenu/orbit_menu_animation_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Menu(),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final heightSize =  MediaQuery.of(context).size.height;
    final widthSize =  MediaQuery.of(context).size.width;
    int numberOfItems = 5;
    List<Item> itemList = List.generate(numberOfItems, (i) =>
        Item(title: (i + 1).toString(), onPressed: () { print('touch $i'); }, image: ''));

    return AnimatedOrbitMenu(
          animate: true,
          config: OrbitMenuConfig(
            animationDuration: Duration(seconds:5),
            animationType: OrbitMenuAnimationType.rotating,
            menuPositionX: widthSize / 2,
            menuPositionY: heightSize / 2,
            menuColor: Colors.deepPurple,
            radius: 100,
            menuItems: itemList,
            itemSize: 150,
            titleStyle: TextStyle(color: Colors.white),
            borderCentralMenuColor: Colors.white,
            itemOffsetPercentage: 0.5,
            myWidget: Container(color: Colors.red,)
          ),
        );
  }
}
