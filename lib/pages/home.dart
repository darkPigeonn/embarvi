import 'package:carousel_slider/carousel_slider.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/daftarPustaka.dart';
import 'package:embarvi/pages/formatif.dart';
import 'package:embarvi/pages/glosarium.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  String nama = '';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      nama = sharedPreferences.get('name').toString();
    });
  }

  //list gambar
  List imagesBanner = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png'
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    List<Menu> menuList = [
      Menu(
        label: 'Pendahuluan',
        icon: '1.png',
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => PendahuluanPage())),
      ),
      Menu(
        label: 'Petunjuk',
        icon: '2.png',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => PetunjukPage())),
      ),
      Menu(
        label: 'Indikator',
        icon: '3.png',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => IndikatorPage())),
      ),
      Menu(
        label: 'Peta Konsep',
        icon: '4.png',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => PetaKonsepPage())),
      ),
      Menu(
        label: 'Materi dan Ar',
        icon: '5.png',
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MateriPage())),
      ),
      Menu(
        label: 'LKPD',
        icon: '6.png',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LkpdPage())),
      ),
      Menu(
        label: 'Formatif',
        icon: '7.png',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => FormatifPage())),
      ),
      Menu(
        label: 'Pustaka',
        icon: '8.png',
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => BibliographyPage())),
      ),
      Menu(
        label: 'Glosarium',
        icon: '9.png',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => GlosariumPage())),
      ),
      Menu(
        label: 'Pengembang',
        icon: '10.png',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => PengembangPage())),
      ),
    ];

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
                Header(name: nama),
                Spacing3,
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      return menuList[index];
                    }),
                Spacing3,
                InkWell(
                  onTap: () {},
                  child: CarouselSlider(
                    items: imagesBanner
                        .map((item) => Image.asset(
                              item,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
