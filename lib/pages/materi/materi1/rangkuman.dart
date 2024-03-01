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

class RangkumanPage extends StatefulWidget {
  final Map content;
  const RangkumanPage({super.key, required this.content});

  @override
  State<RangkumanPage> createState() => _RangkumanPageState();
}

class _RangkumanPageState extends State<RangkumanPage> {
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
                                : content[index]['type'] == 'info'
                                    ? Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 50),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 15),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 225, 206, 137),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              content[index]['detail'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              width: 140,
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                content[index]['label'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : content[index]['type'] == 'subTitle2'
                                        ? SubTitle2(
                                            label: content[index]['detail'])
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
                  )
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
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          height: 1.6,
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.circle,
                size: 10.0,
                color: Colors.black,
              ),
            ),
          ),
          TextSpan(
            text: '$text',
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
    // return RichText(
    //   text: TextSpan(
    //     style: const TextStyle(
    //       height: 1.6,
    //       fontSize: 14.0,
    //       color: Colors.black,
    //     ),
    //     children: [
    //       const WidgetSpan(
    //         alignment: PlaceholderAlignment.middle,
    //         child: Padding(
    //           padding: EdgeInsets.only(right: 5.0),
    //           child: Icon(
    //             Icons.circle,
    //             size: 10.0,
    //             color: Colors.black,
    //           ),
    //         ),
    //       ),
    //       TextSpan(
    //         text: '$text',
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0, top: 10),
            child: Icon(
              Icons.circle,
              size: 10.0,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: RichTextCustom(
              content: text,
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
