import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  static int _currentItem = 0;
  static List<DummyPage> pages = [
    DummyPage(color: Colors.green, index: 1),
    DummyPage(color: Colors.blue, index: 2),
    DummyPage(color: Colors.red, index: 3),
    DummyPage(color: Colors.orange, index: 4),
    DummyPage(color: Colors.deepPurple, index: 5),
  ];

  List<BottomNavigationBarItem> navigationItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.ac_unit, color: Colors.green), title: Text('AC unit')),
    BottomNavigationBarItem(
        icon: Icon(Icons.repeat, color: Colors.green), title: Text('repeat')),
    BottomNavigationBarItem(
        icon: Icon(Icons.message, color: Colors.green), title: Text('message')),
    BottomNavigationBarItem(
        icon: Icon(Icons.games, color: Colors.green), title: Text('games')),
    BottomNavigationBarItem(
        icon: Icon(Icons.terrain, color: Colors.green), title: Text('terrain')),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
        controller: _controller,
        scrollDirection: Axis.horizontal,
        reverse: false,
        onPageChanged: (int index) {
          setState(() {
            _currentItem = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentItem,
          onTap: (index) {
            setState(() {
              _currentItem = index;
              _controller.jumpToPage(index);
            });
          },
          items: navigationItems),
    );
  }
}

class DummyPage extends StatelessWidget {
  final Color color;
  final int index;

  DummyPage({@required this.color, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: color,
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
