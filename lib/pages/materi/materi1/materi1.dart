import 'package:embarvi/Components/buttonC.dart';
import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/materi.dart';
import 'package:embarvi/pages/materi/materi1/informasi.dart';
import 'package:embarvi/pages/materi/materi1/materiPembelajaran.dart';
import 'package:embarvi/pages/tugasMandiri.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:flutter/material.dart';

class MenuMateri extends StatefulWidget {
  final Map content;
  const MenuMateri({super.key, required this.content});

  @override
  State<MenuMateri> createState() => _MenuMateriState();
}

class _MenuMateriState extends State<MenuMateri> {
  List content = indikator['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: primaryC,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Spacing2,
                  TitlePageMateri(
                    title: widget.content['title'],
                  ),
                  Spacing1,
                  Spacing3,
                  Button1Materi(
                      onPressed: () {
                        Map dataContent = {};
                        if (widget.content['code'] == 1) {
                          dataContent = iu_materi1;
                        } else {
                          dataContent = iu_materi2;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InformationPage(
                                      content: dataContent,
                                    )));
                      },
                      icon: Icons.menu_book,
                      label:
                          'Informasi Umum (Capaian Pembelajaran, Tujuan Pembelajaran)'),
                  Spacing3,
                  Button2Materi(
                      onPressed: () {
                        Map dataContent = {};

                        if (widget.content['code'] == 1) {
                          dataContent = mp_materi1;
                        } else {
                          dataContent = mp_materi2;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MateriPembelajaran(
                                    content: dataContent,
                                    code: widget.content['code'])));
                      },
                      icon: Icons.menu_book,
                      label: 'Uraian Materi'),
                  Spacing3,
                  Button3Materi(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TugasMandiri(
                                    code: widget.content['code'])));
                      },
                      icon: Icons.menu_book,
                      label: 'Tugas Mandiri')
                ],
              ),
            ),
            BottomBack()
          ],
        ),
      )),
    );
  }
}
