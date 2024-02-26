import 'package:carousel_slider/carousel_slider.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/daftarPustaka.dart';
import 'package:embarvi/pages/diskusi.dart';
import 'package:embarvi/pages/formatif.dart';
import 'package:embarvi/pages/glosarium.dart';
import 'package:embarvi/pages/home.dart';
import 'package:embarvi/pages/indikator.dart';
import 'package:embarvi/pages/lkpd.dart';
import 'package:embarvi/pages/materi.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/pages/pengambang.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/pages/petunjuk.dart';
import 'package:embarvi/pages/services/userController.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/textStlyLib.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentPageIndex = 0;
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

  UserData userData = UserData();
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
      backgroundColor: primaryC,
      body: Stack(
        children: [
          Flexible(
            child: [
              HomePage(),
              LkpdPage(),
              MateriPage(),
              DiskusiPage(),
              PetunjukPage()
            ][currentPageIndex],
          ),
          Stack(
            children: [BottomNavigationCustom()],
          )
        ],
      ),
    );
  }
}
