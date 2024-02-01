import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/textStlyLib.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Beranda',
      style: optionStyle,
    ),
    Text(
      'Index 1: LKPD',
      style: optionStyle,
    ),
    Text(
      'Index 2: Materi dan Ar',
      style: optionStyle,
    ),
    Text(
      'Index 3: Diskusi',
      style: optionStyle,
    ),
    Text(
      'Index 4: Petunjuk',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: primaryC,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                const Header(),
                Spacing2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                  ],
                ),
                Spacing3,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                  ],
                ),
                Spacing3,
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'LKPD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Materi dan Ar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Diskusi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informasi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.red,
      ),
    );
  }
}