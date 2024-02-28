import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/diskusi.dart';
import 'package:embarvi/pages/layout.dart';
import 'package:embarvi/pages/lkpd.dart';
import 'package:embarvi/pages/materi.dart';
import 'package:embarvi/pages/petunjuk.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PetaKonsepPage extends StatefulWidget {
  const PetaKonsepPage({super.key});

  @override
  State<PetaKonsepPage> createState() => _PetaKonsepPageState();
}

class _PetaKonsepPageState extends State<PetaKonsepPage> {
  List content = indikator['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryC,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: marginPrimary,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Spacing2,
                  TitlePage(
                    title: petaKonsep['title'].toString(),
                  ),
                  Spacing2,
                  Container(
                    child: Image.asset(
                      'assets/images/petaKonsep.png',
                      scale: 1,
                    ),
                  ),
                ],
              ),
            ),
            BottomNavigationCustom(),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationCustom extends StatelessWidget {
  const BottomNavigationCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: primaryC,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Menu2(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LayoutPage()));
                },
                icon: '11.png',
                label: 'Beranda'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LkpdPage()));
                },
                icon: '6.png',
                label: 'LPKD'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MateriPage()));
                },
                icon: '5.png',
                label: 'Materi & AR'),
            Menu2(
                onPressed: () {
                  ;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DiskusiPage()));
                },
                icon: '12.png',
                label: 'Diskusi'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PetunjukPage()));
                },
                icon: '2.png',
                label: 'Petunjuk'),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationCustomHome extends StatelessWidget {
  const BottomNavigationCustomHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: primaryC,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Menu2(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Keluar dari Aplikasi?'),
                      content: Text('Anda yakin ingin keluar dari aplikasi?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Tidak'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            SystemNavigator.pop(); // Menutup aplikasi
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
                icon: 'exit.png',
                label: 'Keluar'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LkpdPage()));
                },
                icon: '6.png',
                label: 'LPKD'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MateriPage()));
                },
                icon: '5.png',
                label: 'Materi & AR'),
            Menu2(
                onPressed: () {
                  ;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DiskusiPage()));
                },
                icon: '12.png',
                label: 'Diskusi'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PetunjukPage()));
                },
                icon: '2.png',
                label: 'Petunjuk'),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationCustom2 extends StatelessWidget {
  const BottomNavigationCustom2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: primaryC,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Menu2(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: '14.png',
                label: 'Kembali'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LkpdPage()));
                },
                icon: '6.png',
                label: 'LPKD'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MateriPage()));
                },
                icon: '5.png',
                label: 'Materi & AR'),
            Menu2(
                onPressed: () {
                  ;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DiskusiPage()));
                },
                icon: '12.png',
                label: 'Diskusi'),
            Menu2(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PetunjukPage()));
                },
                icon: '2.png',
                label: 'Petunjuk'),
          ],
        ),
      ),
    );
  }
}
