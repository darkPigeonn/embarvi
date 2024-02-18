import 'package:carousel_slider/carousel_slider.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/daftarPustaka.dart';
import 'package:embarvi/pages/formatif.dart';
import 'package:embarvi/pages/indikator.dart';
import 'package:embarvi/pages/lkpd.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/pages/petunjuk.dart';
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

  //list gambar
  List imagesBanner = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png'
  ];
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
                      label: 'Pendahuluan',
                      icon: Icons.message,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      label: 'Petunjuk',
                      icon: Icons.info,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetunjukPage())),
                    ),
                    Menu(
                      label: 'Indikator',
                      icon: Icons.settings,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndikatorPage())),
                    ),
                    Menu(
                      label: 'Peta Konsep',
                      icon: Icons.map,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetaKonsepPage())),
                    ),
                    Menu(
                      label: 'Materi dan Ar',
                      icon: Icons.book,
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
                      label: 'LKPD',
                      icon: Icons.bookmark_add_rounded,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LkpdPage())),
                    ),
                    Menu(
                      label: 'Formatif',
                      icon: Icons.leaderboard,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormatifPage())),
                    ),
                    Menu(
                      label: 'Pustaka',
                      icon: Icons.search,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BibliographyPage())),
                    ),
                    Menu(
                      label: 'Glosarium',
                      icon: Icons.tab_unselected_sharp,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                    Menu(
                      label: 'Pengembang',
                      icon: Icons.people,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendahuluanPage())),
                    ),
                  ],
                ),
                Spacing3,
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: imagesBanner.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            color: bPrimary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
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
