import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final Random random = Random();
final List<Widget> gridViewItemList = List.generate(100, (index) {
  return MyGridViewItem(
    text: index.toString(),
    color: Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    ),
  );
});
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Center(
        child: Column(
          children: [
            Expanded(child: GridContainer(child: SimpleGridView())),
            Expanded(child: GridContainer(child: GridViewCount())),
            Expanded(child: GridContainer(child: GridViewBuilder())),
            Expanded(child: GridContainer(child: GridViewCustom())),
            Expanded(child: GridContainer(child: GridViewExtent())),
          ],
        ),
      ),
    );
  }
}

class MyGridViewItem extends StatelessWidget {
  final String text;
  final Color? color;
  MyGridViewItem({required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text('$text', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  Color? color;
  Widget child;

  GridContainer({required this.child, this.color});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      clipBehavior: .hardEdge,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

//grid variations
class SimpleGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 5,
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      // ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 50,
        mainAxisExtent: 50,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      children: gridViewItemList,
    );
  }
}

class GridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: BouncingScrollPhysics(),
      children: gridViewItemList,
    );
  }
}

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return MyGridViewItem(text: '$index', color: Colors.redAccent);
      },
    );
  }
}

class GridViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 30,
        mainAxisExtent: 30,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      // childrenDelegate: SliverChildListDelegate(gridViewItemList),
      childrenDelegate: SliverChildBuilderDelegate((context, index) {
        return MyGridViewItem(text: '$index', color: Colors.orangeAccent);
      }, childCount: 100),
    );
  }
}

class GridViewExtent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 50,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      scrollDirection: .horizontal,
      children: gridViewItemList,
    );
  }
}
