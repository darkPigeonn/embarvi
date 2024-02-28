import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:flutter/material.dart';

class IndikatorPage extends StatefulWidget {
  const IndikatorPage({super.key});

  @override
  State<IndikatorPage> createState() => _IndikatorPageState();
}

class _IndikatorPageState extends State<IndikatorPage> {
  List content = indikator['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryC,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing2,
                  TitlePage(
                    title: indikator['title'].toString(),
                  ),
                  Spacing3,
                  ListView.builder(
                      itemCount: content.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return content[index]['type'] == 'text'
                            ? RichTextCustom(content: content[index]['detail'])
                            : SubTitle(
                                label: content[index]['detail'],
                              );
                        // return Text(content[0].toString(),
                        //     textAlign: TextAlign.justify,
                        //     style: TextStyle(height: 1.8));
                      }),
                  const BulletItem(
                      text:
                          'Menganalisis sejarah penemuan virus dengan benar.'),
                  const BulletItem(
                      text: 'Menganalisis ciri-ciri virus dengan benar.'),
                  const BulletItem(
                      text:
                          'Menentukan struktur dan bentuk virus dengan benar.'),
                  const BulletItem(
                      text: 'Menganalisis cara hidup virus dengan benar.'),
                  const BulletItem(
                      text:
                          'Menganalisis proses replikasi virus dengan benar.'),
                  const BulletItem(
                      text:
                          'Menentukan peranan virus dalam kehidupan dengan benar.'),
                  Spacing1,
                ],
              ),
            ),
          ),
          Stack(
            children: [BottomNavigationCustom()],
          )
        ],
      )),
    );
  }
}

class BulletItem extends StatelessWidget {
  final String text;
  const BulletItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(right: 10, top: 10, left: 10),
            child: Icon(
              Icons.circle,
              size: 10.0,
              color: Colors.black,
            )),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                height: 1.6,
                fontSize: 17.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: '$text',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BulletNumber extends StatelessWidget {
  final String text;
  final String number;
  const BulletNumber({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text('$number.', style: TextStyle(height: 1.6))),
          Flexible(
              child: Text(
            '$text',
            textAlign: TextAlign.justify,
            style: TextStyle(height: 1.6, fontSize: 16),
          ))
        ],
      ),
    );
  }
}
