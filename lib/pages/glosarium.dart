import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';

class GlosariumPage extends StatefulWidget {
  const GlosariumPage({super.key});

  @override
  State<GlosariumPage> createState() => _GlosariumPageState();
}

class _GlosariumPageState extends State<GlosariumPage> {
  List content = pendahuluan['content'] as List;
  List thisData = glosarium;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: primaryC,
              margin: marginPrimary,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Spacing2,
                  TitlePage(
                    title: 'Glosarium',
                  ),
                  Spacing2,
                  // ConstrainedBox(
                  //   constraints: BoxConstraints(maxHeight: 2000, minHeight: 100.0),
                  //   child: ListView.builder(
                  //       itemCount: glosarium.length,
                  //       shrinkWrap: false,
                  //       physics: NeverScrollableScrollPhysics(),
                  //       itemBuilder: (context, index) {
                  //         Map thisData = glosarium[index];
                  //         return TableCustoms(
                  //           number: thisData['number'],
                  //           label: thisData['label'],
                  //           description: thisData['description'],
                  //         );
                  //       }),
                  // ),
                  for (var i in thisData)
                    TableCustoms(
                      number: i['number'],
                      label: i['label'],
                      description: i['description'],
                    ),
                  Spacing3,
                  SizedBox(
                    height: 100,
                  ),
                  // Container(
                  //   child: Text(pendahuluan['content'].toString()),
                  // )
                ],
              ),
            ),
          ),
          BottomNavigationCustom()
        ],
      )),
    );
  }
}

class TableCustoms extends StatelessWidget {
  const TableCustoms({
    super.key,
    required this.number,
    required this.label,
    required this.description,
  });
  final int number;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: number % 2 == 0
              ? Color.fromARGB(255, 243, 243, 243)
              : Colors.white,
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 22,
                child: Text(
                  number.toString() + '.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  label.contains('<i>')
                      ? label.split('>')[1].toString().split('<')[0].toString()
                      : label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: label.contains('<i>')
                          ? FontStyle.italic
                          : FontStyle.normal),
                ),
              ),
              Container(
                child: Flexible(
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
