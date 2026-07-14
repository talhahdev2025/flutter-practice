import 'package:flutter/material.dart';
import 'page_body.dart';


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBody(
      text: 'This is Second Page',
      btnText: 'Go to Home',
      color: Colors.blueAccent,
      // switchPage: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => MyHomePage(title: 'this is homepage'),
      //   ),
      // ),
      switchPage: () => Navigator.pop(context),
    );
  }
}
