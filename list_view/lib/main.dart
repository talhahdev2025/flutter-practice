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
      debugShowCheckedModeBanner: false,
      title: 'List View',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(title: 'List View Practice'),
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
  late List<bool> selectedList;
  static const listLength = 30;
  bool isSelectionMode = false;
  bool selectAll = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedList = List.generate(listLength, (index) => false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    selectedList.clear();
    selectAll = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: isSelectionMode
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    isSelectionMode = false;
                    selectAll = false;
                    selectedList = List.generate(listLength, (index) => false);
                  });
                },
              )
            : SizedBox(),
        actions: [
          isSelectionMode
              ? TextButton(
                  child: Text(selectAll ? 'UnelectAll' : 'selectAll'),
                  onPressed: () {
                    setState(() {
                      selectAll = !selectAll;
                      selectedList = List.generate(
                        listLength,
                        (index) => selectAll,
                      );
                    });
                  },
                )
              : SizedBox(),
        ],
        centerTitle: true,
        title: Text(
          isSelectionMode
              ? '${selectedList.where((e) => e).length} selected'
              : 'Clients',
        ),
      ),
      body: Center(
        child: ListView(
          children: List.generate(listLength, (index) {
            var rand = Random();
            return ListTile(
              title: Text(people[index]['first_name']!),
              subtitle: Text(people[index]['occupation']!),
              leading: selectedList[index]
                  ? Checkbox(
                      value: selectedList[index],
                      tristate: true,
                      onChanged: (value) => setState(() {
                        selectedList[index] = !selectedList[index];
                      }),
                    )
                  : CircleAvatar(
                      backgroundColor: Color.fromARGB(
                        100,
                        rand.nextInt(255),
                        rand.nextInt(255),
                        rand.nextInt(255),
                      ),
                      foregroundImage: NetworkImage(people[index]['image']!),
                      child: Text(
                        people[index]['first_name']!
                            .substring(0, 1)
                            .toUpperCase(),
                      ),
                    ),
              trailing: Icon(Icons.grid_3x3),
              // selectedTileColor: Colors.amber,
              onTap: () {
                if (isSelectionMode) {
                  setState(() {
                    selectedList[index] = !selectedList[index];
                  });
                }
              },
              onLongPress: () {
                setState(() {
                  isSelectionMode = true;
                  selectedList[index] = true;
                });
              },
              selected: selectedList[index],
            );
          }),
        ),
      ),
    );
  }
}

// use model class instead of map
final List<Map<String, String>> people = [
  {
    'first_name': 'Emma',
    'occupation': 'UI/UX Designer',
    'image':
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'James',
    'occupation': 'Software Engineer',
    'image':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
  },
  {
    'first_name': 'Sophia',
    'occupation': 'Photographer',
    'image':
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'Olivia',
    'occupation': 'Content Writer',
    'image': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'James',
    'occupation': 'Software Engineer',
    'image':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
  },
  {
    'first_name': 'Sophia',
    'occupation': 'Photographer',
    'image':
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'Emma',
    'occupation': 'UI/UX Designer',
    'image':
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'James',
    'occupation': 'Software Engineer',
    'image':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
  },
  {
    'first_name': 'Sophia',
    'occupation': 'Photographer',
    'image':
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'Olivia',
    'occupation': 'Content Writer',
    'image': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'James',
    'occupation': 'Software Engineer',
    'image':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
  },
  {
    'first_name': 'Sophia',
    'occupation': 'Photographer',
    'image':
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'James',
    'occupation': 'Software Engineer',
    'image':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
  },
  {
    'first_name': 'Olivia',
    'occupation': 'Content Writer',
    'image': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
  {
    'first_name': 'James',
    'occupation': 'Software Engineer',
    'image':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
  },
  {
    'first_name': 'Sophia',
    'occupation': 'Photographer',
    'image':
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400',
  },
  {
    'first_name': 'Liam',
    'occupation': 'Digital Marketer',
    'image':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
  },
];
