import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';

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
          child: SingleChildScrollView(
        child: Container(
          margin: marginPrimary,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Spacing3,
              TitlePage(
                title: pendahuluan['title'].toString(),
              ),
              Spacing3,
              Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(bottom: 40, left: 10, right: 10),
                child: ListView.builder(
                    itemCount: content.length,
                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RichTextCustom(
                          content: content[index]['detail'].toString());
                    }),
              ),

              // Container(
              //   child: Text(pendahuluan['content'].toString()),
              // )
            ],
          ),
        ),
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
    print(text);
    List<TextSpan> textSpans = [
      TextSpan(
        text:
            '\ t t t', // Tambahkan spasi tambahan di antara karakter tab dan teks
        style: TextStyle(
          height: 1.6,
          fontSize: 17, // Sesuaikan ukuran teks sesuai kebutuhan
        ),
      ),
    ];
    RegExp regex = RegExp(r'<i>(.*?)<\/i>');

    List<RegExpMatch> matches = regex.allMatches(text).toList();
    List<String> splitText = text.split(regex);

    for (int i = 0; i < splitText.length; i++) {
      textSpans.add(TextSpan(
          text: splitText[i],
          style: TextStyle(height: 1.6, fontSize: 17, color: Colors.black)));

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
    print(text);
    List<TextSpan> textSpans = [];
    var italicMatches = RegExp(r'<i>(.*?)<\/i>').allMatches(text);
    var boldMatches = RegExp(r'<b>(.*?)<\/b>').allMatches(text);

    var parts = text.split(RegExp(r'<b>(.*?)<\/b>|<i>(.*?)<\/i>'));

    for (int i = 0; i < parts.length; i++) {
      textSpans.add(TextSpan(
          text: parts[i],
          style: TextStyle(height: 1.6, color: Colors.black, fontSize: 9)));

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
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)));

      if (i < matchesBold.length) {
        textSpans.add(TextSpan(
          text: matchesBold[i].group(1),
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black),
        ));
      }
    }

    var italicMatches = RegExp(r'<i>(.*?)<\/i>').allMatches(text);
    var boldMatches = RegExp(r'<b>(.*?)<\/b>').allMatches(text);

    var parts = text.split(RegExp(r'<b>(.*?)<\/b>|<i>(.*?)<\/i>'));

    for (int i = 0; i < parts.length; i++) {
      textSpans.add(TextSpan(
          text: parts[i], style: TextStyle(height: 1.6, color: Colors.black)));

      if (i < italicMatches.length) {
        textSpans.add(TextSpan(
          text: italicMatches.elementAt(i).group(1),
          style: TextStyle(fontStyle: FontStyle.italic),
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
      textAlign: TextAlign.justify,
      text: TextSpan(children: textSpans),
    );
  }
}
