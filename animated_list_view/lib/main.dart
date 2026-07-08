import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = List.generate(20, (index) => 'Vacination for ${index}');
  GlobalKey<SliverAnimatedListState> listKey = GlobalKey();

  void _addItem() {
    list.insert(0, 'vacianation for ${list.length}');
    listKey.currentState!.insertItem(0, duration: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              actions: [
                IconButton(icon: Icon(Icons.add_circle), onPressed: _addItem),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Animated List View'),
              ),
            ),
            SliverAnimatedList(
              key: listKey,
              initialItemCount: list.length,
              itemBuilder: (context, index, animation) {
                return ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(parent: animation, curve: Curves.bounceIn),
                  ),
                  child: ListTile(
                    minTileHeight: 200,
                    title: Text(list[index]),
                    trailing: Icon(Icons.arrow_drop_down_rounded),
                    isThreeLine: true,
                    subtitle: Text('this is subltitle '),
                    leading: CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      child: FlutterLogo(),
                    ),

                    // onTap: setState(() {}),
                  ),
                );
              },
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: .center,
                color: Theme.of(context).primaryColorLight,
                child: Text('end of list '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
