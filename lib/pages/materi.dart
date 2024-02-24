import 'package:embarvi/Components/buttonC.dart';
import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/materi/materi1/materi1.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:flutter/material.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  List content = indikator['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: primaryC,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Spacing2,
                  const TitlePage(
                    title: 'Materi',
                  ),
                  Spacing1,
                  Spacing3,
                  Button1(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuMateri(
                                      content: materi1,
                                    )));
                      },
                      icon: Icons.menu_book,
                      label: 'Sejarah, Ciri, Struktur, dan Bentuk Virus'),
                  Spacing3,
                  Button2(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuMateri(
                                      content: materi2,
                                    )));
                      },
                      icon: Icons.menu_book,
                      label: 'Cara hidup, Replikasi, dan Peranan Virus')
                ],
              ),
            ),
          ),
          BottomBack()
        ],
      )),
    );
  }
}

class BottomBack extends StatelessWidget {
  const BottomBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/images/icons/14.png',
              width: 60,
              height: 60,
            ),
          )
        ],
      ),
    );
  }
}
