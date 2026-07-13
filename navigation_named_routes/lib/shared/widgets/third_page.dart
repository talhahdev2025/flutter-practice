import 'package:flutter/material.dart';
import 'page_body.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageBody(
      text: 'This is Third Page',
      btnText: 'Go to Home',
      color: Colors.deepOrangeAccent,
      switchPage: () => Navigator.pop(context),
    );
  }
}
