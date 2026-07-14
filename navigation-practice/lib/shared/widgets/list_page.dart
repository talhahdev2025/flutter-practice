import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
        actions: [
          IconButton(icon: Icon(Icons.refresh_rounded), onPressed: null),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Center(child: MyCard()),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with TickerProviderStateMixin {
  static const duration = Duration(milliseconds: 250);

  late AnimationController controller;
  late Animation animation;

  void animate() {}

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: duration);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation.addListener(() => setState(() {}));
    controller.repeat(count: 1, reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments
            as ({String title, num price, String image});
    return GestureDetector(
      onTap: animate,
      child: Transform.scale(
        alignment: .center,
        scale: animation.value,
        child: Container(
          alignment: .center,
          width: 400,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Column(
            children: [
              Image.network(arguments.image, fit: BoxFit.cover),
              Spacer(),
              Text(arguments.title),
              Text('${arguments.price}\$'),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
