import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'shared/widgets/second_page.dart';
import 'shared/widgets/third_page.dart';
import 'shared/widgets/page_body.dart';
import 'shared/widgets/list_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  late Map<String, dynamic> data;
  bool isLoading = true;
  Future<void> _loadHomePageData() async {
    const dataUrl = 'https://dummyjson.com/products';
    final response = await http.get(Uri.parse(dataUrl));
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      setState(() {
        isLoading = false;
        // print('${data['products'][1]['images'][0]}');
        print('${data['products'][1]}');
      });
    } else {
      print('failed to fetch data status code is not 200');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            isLoading
                ? Center(child: Text('Fetching data...'))
                : Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/listPage',
                            arguments: (
                              title: data['products'][index]['title'],
                              price: data['products'][index]['price'],
                              image: data['products'][index]['images'][0],
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              border: Border.all(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              mainAxisAlignment: .start,
                              spacing: 8,
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  foregroundImage: NetworkImage(
                                    data['products'][index]['thumbnail'],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      data['products'][index]['title'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Price ${data['products'][index]['price']}',
                                      style: TextStyle(
                                        fontSize: 16,
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
