import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';

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
                  Navigator.pop(context);
                },
                icon: '11.png',
                label: 'Beranda'),
            Menu2(onPressed: () {}, icon: '6.png', label: 'LPKD'),
            Menu2(onPressed: () {}, icon: '5.png', label: 'Materi & AR'),
            Menu2(onPressed: () {}, icon: '12.png', label: 'Diskusi'),
            Menu2(onPressed: () {}, icon: '2.png', label: 'Petunjuk'),
          ],
        ),
      ),
    );
  }
}
