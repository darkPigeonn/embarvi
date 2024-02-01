import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
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
                title: pendahuluan['title'].toString(),
              ),
              Spacing3,
              Expanded(
                child: ListView.builder(
                    itemCount: content.length,
                    itemBuilder: (context, index) {
                      // return RichText(
                      //   textAlign: TextAlign.justify,
                      //   text: TextSpan(
                      //     children: <TextSpan>[
                      //       TextSpan(
                      //         text:
                      //             '\ t', // Tambahkan spasi tambahan di antara karakter tab dan teks
                      //         style: TextStyle(
                      //           fontSize:
                      //               16, // Sesuaikan ukuran teks sesuai kebutuhan
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: content[0].toString(),
                      //         style: DefaultTextStyle.of(context).style,
                      //       ),
                      //     ],
                      //   ),
                      // );
                      // return Text(content[0].toString(),
                      //     textAlign: TextAlign.justify,
                      //     style: TextStyle(height: 1.8));
                    }),
              )
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
