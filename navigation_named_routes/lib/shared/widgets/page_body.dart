import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  String text, btnText;
  VoidCallback switchPage;
  Color color;
  PageBody({
    required this.text,
    required this.btnText,
    required this.switchPage,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: color,
          child: Column(
            mainAxisAlignment: .spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
              ),
              FilledButton(
                onPressed: switchPage,
                child: Text(btnText, style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
