import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: primaryC,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Spacing3,
              TitlePage(
                title: petaKonsep['title'].toString(),
              ),
              Spacing3,
              Container(
                child: Image.asset(
                  'assets/images/petaKonsep.png',
                  scale: 1,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
