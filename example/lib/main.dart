import 'package:flutter/material.dart';
import 'package:orbitmenu/orbitmenu.dart';
import 'package:orbitmenu/item.dart';

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

    return Stack(
        children: OrbitMenu.createMenu(
          menuPositionX: widthSize / 2,
          menuPositionY: heightSize / 2,
          menuColor: Colors.black,
          borderCentralMenuColor: Colors.white,
          radius: 150,
          menuItems: itemList,
          itemBorderColor: Colors.transparent,
          itemSize: 50,
          itemColor: Colors.red,
          animationOffset: 500,
          itemOffsetPercentage: 0.0,
        )
    );
  }
}
