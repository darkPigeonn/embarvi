import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/layout.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DiskusiPage extends StatefulWidget {
  const DiskusiPage({super.key});

  @override
  State<DiskusiPage> createState() => _DiskusiPageState();
}

class _DiskusiPageState extends State<DiskusiPage> {
  List content = [
    'Silahkan isi kolom diskusi yang telah disediakan dengan cara mengklik tanda panah dibagian kanan atas Padlet. ',
    'Silahkan membuat topik diskusi ataupun memberikan tanggapan  antar teman.',
    'Diskusikan berbagai hal yang ingin diketahui/pelajari/ulasan terkait pembelajaran pada materi virus.',
    'Gunakanlah bahasa Indonesia yang baik dan benar, hindari menggunakan kata-kata yang tidak sopan. '
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryC,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    color: primaryC,
                    margin: marginPrimary,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacing2,
                        TitlePage(
                          title: 'Forum Diskusi',
                        ),
                        Spacing2,
                        Text(
                          'Petunjuk Diskusi :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        ListView.builder(
                          itemCount: content.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  (index + 1).toString() + '. ',
                                  style: TextStyle(fontSize: 17, height: 1.6),
                                ),
                                Flexible(
                                    child: Text(
                                  content[index],
                                  style: TextStyle(fontSize: 17, height: 1.6),
                                  textAlign: TextAlign.justify,
                                )),
                              ],
                            );
                          }),
                        ),
                        Spacing2,
                        Container(
                          margin: EdgeInsets.only(bottom: 100),
                          child: HtmlWidget(
                              '<div class="padlet-embed" style="border:1px solid rgba(0,0,0,0.1);border-radius:2px;box-sizing:border-box;overflow:hidden;position:relative;width:100%;background:#F4F4F4"><p style="padding:0;margin:0"><iframe src="https://padlet.com/embed/n924qxpqtsowyupo" frameborder="0" allow="camera;microphone;geolocation" style="width:100%;height:608px;display:block;padding:0;margin:0"></iframe></p><div style="display:flex;align-items:center;justify-content:end;margin:0;height:28px"><a href="https://padlet.com?ref=embed" style="display:block;flex-grow:0;margin:0;border:none;padding:0;text-decoration:none" target="_blank"><div style="display:flex;align-items:center;"><img src="https://padlet.net/embeds/made_with_padlet_2022.png" width="114" height="28" style="padding:0;margin:0;background:0 0;border:none;box-shadow:none" alt="Made with Padlet"></div></a></div></div>'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: primaryC,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Menu2(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LayoutPage()));
                      },
                      icon: '11.png',
                      label: 'Beranda'),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
