import 'package:flutter/material.dart';
import 'package:navigation_one_point_o/main.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var res = ModalRoute.of(context)?.settings.arguments;
    return Directionality(
      textDirection: .ltr,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.redAccent),
                child: Text(res.toString(), textAlign: .center),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MyHomePage(title: 'flutter demo'),
                  //   ),
                  // );
                  Navigator.of(context).pop(
                   'back to home'
                  );
                },
                child: Text('Go Back!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
