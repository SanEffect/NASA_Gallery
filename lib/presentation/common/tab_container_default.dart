import 'package:flutter/material.dart';

import '../gallery/gallery_screen.dart';
import '../main/main_screen.dart';

class TabContainerDefault extends StatefulWidget {
  const TabContainerDefault({required Key key}) : super(key: key);

  @override
  _TabContainerDefaultState createState() => _TabContainerDefaultState();
}

class _TabContainerDefaultState extends State<TabContainerDefault> {
  List<Widget> listScreens = [];
  @override
  void initState() {
    super.initState();
    listScreens = [
      const MainScreen(),
      const GalleryScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(), children: listScreens),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Gallery',
                icon: Icon(Icons.image),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}