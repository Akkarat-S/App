import 'package:card_bd/Servicrs/listbox_service.dart';
import 'package:card_bd/UIs/add_box.dart';
import 'package:card_bd/UIs/add_card.dart';
import 'package:card_bd/UIs/deck.dart';
import 'package:card_bd/UIs/search_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MenuBarPage(),
    );
  }
}

class MenuBarPage extends StatefulWidget {
  const MenuBarPage({Key? key}) : super(key: key);

  @override
  State<MenuBarPage> createState() => _MenuBarPageState();
}

class _MenuBarPageState extends State<MenuBarPage> {
  int _selectedIndex = 0;
  static var lsbox;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    SearchCard(),
    AddBox(),
    AddCard(),
    Deck(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('System Administrator'),
        backgroundColor: const Color(0xFF025564),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'AddBox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'AddCard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Deck',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF025564),
        onTap: _onItemTapped,
      ),
    );
  }
}
