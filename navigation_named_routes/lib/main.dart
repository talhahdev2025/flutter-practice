import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'shared/widgets/second_page.dart';
import 'shared/widgets/third_page.dart';
import 'shared/widgets/page_body.dart';
import 'shared/widgets/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/secondPage': (context) => SecondPage(),
        '/thirdPage': (context) => ThirdPage(),
        '/listPage': (context) => ListPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  FilledButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/secondPage'),
                    child: Text(
                      'Go to Second Page',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.pushNamed(context, '/thirdPage'),
                    child: Text(
                      'Go to Third Page',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/listPage'),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                'this is title # $index',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'subtitle $index',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
