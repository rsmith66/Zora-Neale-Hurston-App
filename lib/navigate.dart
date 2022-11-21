import 'package:flutter/material.dart';
import 'package:zora_neale_hurston/bio.dart';
import 'package:zora_neale_hurston/game.dart';
import 'package:zora_neale_hurston/timeline.dart';
import 'package:zora_neale_hurston/works.dart';

void main() {
  runApp(const Navigate());
}
//Class that builds the bottom tab and works to direct users around the app
class Navigate extends StatelessWidget {
  const Navigate({super.key});

  static const String _title = 'Biography Page';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState()=> Nav();
}

class Nav extends State<MyStatefulWidget> {
  int selectedIndex = 0;
  static const List<Widget> pages = [
    BioPage(),
    TimelinePage(),
    WorksPage(),
    Game()
  ];

  Future<void> onTapped(int index) async {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(   //Build bottom navigation bar
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
                icon: Icon(Icons.girl),
                label: 'Biography',
          ),
          BottomNavigationBarItem(
                icon: Icon(Icons.timeline),
                label: 'Timeline',
          ),
          BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: 'Works',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: 'Quiz'
          )],
          currentIndex: selectedIndex,
          onTap: onTapped,
      ),
    );
  }
}