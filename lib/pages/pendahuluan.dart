import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/materi/materi1/materiPembelajaran.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class PendahuluanPage extends StatefulWidget {
  const PendahuluanPage({super.key});

  @override
  State<PendahuluanPage> createState() => _PendahuluanPageState();
}

class _PendahuluanPageState extends State<PendahuluanPage> {
  List content = pendahuluan['content'] as List;
  @override
  Widget build(BuildContext context) {
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
                    title: 'Pendahuluan',
                  ),
                  Spacing2,
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
          Stack(
            children: [BottomNavigationCustom()],
          )
        ],
      )),
    );
  }
}

class RichTextCustom extends StatelessWidget {
  const RichTextCustom({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return buildRichTextWithItalic(content);
  }

  Widget buildRichTextWithItalic(String text) {
    List<TextSpan> textSpans = [];

    if (text.contains('\t')) {
      textSpans.add(
        TextSpan(
          text:
              'HA ', // Tambahkan spasi tambahan di antara karakter tab dan teks
          style: TextStyle(
            color: Colors.transparent,
          ),
        ),
      );
    }
    RegExp regex = RegExp(r'<i>(.*?)<\/i>');

    List<RegExpMatch> matches = regex.allMatches(text).toList();
    List<String> splitText = text.split(regex);

    for (int i = 0; i < splitText.length; i++) {
      textSpans.add(
        TextSpan(
            text: splitText[i],
            style: TextStyle(
              height: 1.6,
              fontSize: 17,
              color: Colors.black,
            )),
      );

      if (i < matches.length) {
        textSpans.add(TextSpan(
          text: matches[i].group(1),
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 17, color: Colors.black),
        ));
      }
    }

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(children: textSpans),
    );
  }
}

class RichTextCustomLabel extends StatelessWidget {
  const RichTextCustomLabel({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return buildRichTextWithItalic(content);
  }

  Widget buildRichTextWithItalic(String text) {
    List<TextSpan> textSpans = [];
    var italicMatches = RegExp(r'<i>(.*?)<\/i>').allMatches(text);
    var boldMatches = RegExp(r'<b>(.*?)<\/b>').allMatches(text);

    var parts = text.split(RegExp(r'<b>(.*?)<\/b>|<i>(.*?)<\/i>'));

    RegExp regex = RegExp(r'\d');

    for (int i = 0; i < parts.length; i++) {
      if (regex.hasMatch(text)) {
        textSpans.add(TextSpan(
            text: parts[i],
            style: TextStyle(
              height: 1.6,
              color: Colors.black,
              fontSize: 9,
            )));
      } else {
        textSpans.add(TextSpan(
            text: parts[i],
            style: TextStyle(
                height: 1.6,
                color: Colors.black,
                fontSize: 9,
                fontWeight: FontWeight.bold)));
      }

      if (i < italicMatches.length) {
        textSpans.add(TextSpan(
          text: italicMatches.elementAt(i).group(1),
          style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.black, fontSize: 9),
        ));
      }

      if (i < boldMatches.length) {
        textSpans.add(TextSpan(
          text: boldMatches.elementAt(i).group(1),
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 9),
        ));
      }
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: textSpans),
    );
  }
}

class RichTextCustomLabelSumber extends StatelessWidget {
  const RichTextCustomLabelSumber({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return buildRichTextWithItalic(content);
  }

  Widget buildRichTextWithItalic(String text) {
    List<TextSpan> textSpans = [];
    var italicMatches = RegExp(r'<i>(.*?)<\/i>').allMatches(text);
    var boldMatches = RegExp(r'<b>(.*?)<\/b>').allMatches(text);

    var parts = text.split(RegExp(r'<b>(.*?)<\/b>|<i>(.*?)<\/i>'));

    RegExp regex = RegExp(r'\d');

    for (int i = 0; i < parts.length; i++) {
      // if (regex.hasMatch(text)) {
      //   textSpans.add(TextSpan(
      //       text: parts[i],
      //       style: TextStyle(
      //         height: 1.6,
      //         color: Colors.black,
      //         fontSize: 9,
      //       )));
      // } else {

      // }
      textSpans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
              height: 1.6,
              color: Colors.black,
              fontSize: 9,
              fontWeight: FontWeight.bold)));

      if (i < italicMatches.length) {
        textSpans.add(TextSpan(
          text: italicMatches.elementAt(i).group(1),
          style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.black, fontSize: 9),
        ));
      }

      if (i < boldMatches.length) {
        textSpans.add(TextSpan(
          text: boldMatches.elementAt(i).group(1),
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 9),
        ));
      }
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: textSpans),
    );
  }
}

class RichTextCustomSumber extends StatelessWidget {
  const RichTextCustomSumber({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return buildRichTextWithItalic(content);
  }

  Widget buildRichTextWithItalic(String text) {
    List<TextSpan> textSpans = [];
    var italicMatches = RegExp(r'<i>(.*?)<\/i>').allMatches(text);
    var boldMatches = RegExp(r'<b>(.*?)<\/b>').allMatches(text);

    var parts = text.split(RegExp(r'<b>(.*?)<\/b>|<i>(.*?)<\/i>'));

    for (int i = 0; i < parts.length; i++) {
      textSpans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            height: 1.6,
            color: Colors.black,
            fontSize: 9,
          )));

      if (i < italicMatches.length) {
        textSpans.add(TextSpan(
          text: italicMatches.elementAt(i).group(1),
          style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.black, fontSize: 9),
        ));
      }

      if (i < boldMatches.length) {
        textSpans.add(TextSpan(
          text: boldMatches.elementAt(i).group(1),
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 9),
        ));
      }
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: textSpans),
    );
  }
}

class RichTextCustom2 extends StatelessWidget {
  const RichTextCustom2(
      {super.key, required this.content, required this.label});
  final String content;
  final String label;
  @override
  Widget build(BuildContext context) {
    return buildRichTextWithItalic(content, label);
  }

  Widget buildRichTextWithItalic(String text, String label) {
    List<TextSpan> textSpans = [];
    RegExp regex = RegExp(r'<i>(.*?)<\/i>');
    RegExp regexBold = RegExp(r'<b>(.*?)<\/b>');

    List<RegExpMatch> matchesBold = regex.allMatches(label).toList();
    List<String> splitTextBold = label.split(regex);

    for (int i = 0; i < splitTextBold.length; i++) {
      textSpans.add(TextSpan(
          text: splitTextBold[i],
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black)));

      if (i < matchesBold.length) {
        textSpans.add(TextSpan(
          text: matchesBold[i].group(1),
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black),
        ));
      }
    }

    var italicMatches = RegExp(r'<i>(.*?)<\/i>').allMatches(text);
    var boldMatches = RegExp(r'<b>(.*?)<\/b>').allMatches(text);

    var parts = text.split(RegExp(r'<b>(.*?)<\/b>|<i>(.*?)<\/i>'));

    for (int i = 0; i < parts.length; i++) {
      textSpans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            height: 1.6,
            color: Colors.black,
            fontSize: 17,
          )));

      if (i < italicMatches.length) {
        textSpans.add(TextSpan(
          text: italicMatches.elementAt(i).group(1),
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 17,
          ),
        ));
      }

      if (i < boldMatches.length) {
        textSpans.add(TextSpan(
          text: boldMatches.elementAt(i).group(1),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ));
      }
    }
    if (label.contains('Menu Materi')) {}

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: textSpans),
    );
  }
}

class RichTextCustomPetunjuk extends StatelessWidget {
  const RichTextCustomPetunjuk(
      {super.key, required this.content, required this.label});
  final String content;
  final String label;
  @override
  Widget build(BuildContext context) {
    return buildRichTextWithItalic(content, label);
  }

  Widget buildRichTextWithItalic(String text, String label) {
    List<TextSpan> textSpans = [];
    RegExp regex = RegExp(r'<i>(.*?)<\/i>');
    RegExp regexBold = RegExp(r'<b>(.*?)<\/b>');

    List<RegExpMatch> matchesBold = regex.allMatches(label).toList();
    List<String> splitTextBold = label.split(regex);

    for (int i = 0; i < splitTextBold.length; i++) {
      textSpans.add(TextSpan(
          text: splitTextBold[i],
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black)));

      if (i < matchesBold.length) {
        textSpans.add(TextSpan(
          text: matchesBold[i].group(1),
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 17, color: Colors.black),
        ));
      }
    }

    var italicMatches = RegExp(r'<i>(.*?)<\/i>').allMatches(text);
    var boldMatches = RegExp(r'<b>(.*?)<\/b>').allMatches(text);

    var parts = text.split(RegExp(r'<b>(.*?)<\/b>|<i>(.*?)<\/i>'));

    for (int i = 0; i < parts.length; i++) {
      textSpans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            height: 1.6,
            color: Colors.black,
            fontSize: 17,
          )));

      if (i < italicMatches.length) {
        textSpans.add(TextSpan(
          text: italicMatches.elementAt(i).group(1),
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 17,
          ),
        ));
      }

      if (i < boldMatches.length) {
        textSpans.add(TextSpan(
          text: boldMatches.elementAt(i).group(1),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
        ));
      }
    }
    if (label.contains('Menu Materi')) {}

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(children: textSpans),
    );
  }
}
