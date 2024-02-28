import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class InformationPage extends StatefulWidget {
  final Map content;
  const InformationPage({super.key, required this.content});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    List content = widget.content['content'] as List;
    return Scaffold(
      backgroundColor: primaryC,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: marginPrimary,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing2,
                  TitlePage(
                    title: widget.content['title'].toString(),
                  ),
                  Spacing3,
                  ListView.builder(
                      itemCount: content.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return content[index]['type'] == 'text'
                            ? RichTextCustom(content: content[index]['detail'])
                            : content[index]['type'] == 'bullet'
                                ? BulletItem2(text: content[index]['detail'])
                                : content[index]['type'] == 'images'
                                    ? Column(
                                        children: [
                                          InstaImageViewer(
                                              child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: ClipRRect(
                                              child: Image.asset(
                                                  'assets/images/materi/' +
                                                      content[index]['name']),
                                            ),
                                          )),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 217, 196, 136),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Gambar',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 11),
                                                    ),
                                                    Text(
                                                      ' : ' +
                                                          content[index]
                                                              ['label'],
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Sumber',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                    Text(
                                                      ' : ' +
                                                          content[index]
                                                              ['Sumber'],
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : SubTitle(
                                        label: content[index]['detail'],
                                      );
                        // return Text(content[0].toString(),
                        //     textAlign: TextAlign.justify,
                        //     style: TextStyle(height: 1.8));
                      }),
                  Spacing3,
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationCustom2()
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0, top: 6),
            child: Icon(
              Icons.circle,
              size: 10.0,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: Text(
              '$text',
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletItem2 extends StatelessWidget {
  final String text;
  const BulletItem2({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0, top: 6),
            child: Icon(
              Icons.circle,
              size: 10.0,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: Text(
              '$text',
              style: TextStyle(height: 1.5, fontSize: 17),
            ),
          ),
        ],
      ),
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
            style: TextStyle(
              height: 1.6,
            ),
          ))
        ],
      ),
    );
  }
}
