import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Scroll View',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Custom Scroll View Practice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('this is title'),
                leading: CircleAvatar(backgroundColor: Colors.orange[200]),
              );
            },
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              ),
            itemCount: 10,

            itemBuilder: (context, index) =>
                Container(color: Colors.pinkAccent, height: 50),
            /*
            [
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
              Container(color: Colors.pinkAccent, height: 50),
            ],
            */
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                // color: Colors.amber,
                width: 200,
                height: 300,
                child: Stack(
                  alignment: .center,
                  children: [
                    Transform.rotate(
                      angle: pi / 50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(16),
                        ),

                        height: 100,
                      ),
                    ),
                    Transform.rotate(
                      angle: -pi / 50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        // width: 100,
                        height: 100,
                      ),
                    ),
                    Transform.rotate(
                      angle: pi / 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        // width: 100,
                        height: 100,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
