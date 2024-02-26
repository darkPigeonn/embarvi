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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryC,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                color: primaryC,
                margin: marginPrimary,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Spacing2,
                    TitlePage(
                      title: 'Diskusi',
                    ),
                    Spacing2,
                    HtmlWidget(
                        '<div class="padlet-embed" style="border:1px solid rgba(0,0,0,0.1);border-radius:2px;box-sizing:border-box;overflow:hidden;position:relative;width:100%;background:#F4F4F4"><p style="padding:0;margin:0"><iframe src="https://padlet.com/embed/n924qxpqtsowyupo" frameborder="0" allow="camera;microphone;geolocation" style="width:100%;height:608px;display:block;padding:0;margin:0"></iframe></p><div style="display:flex;align-items:center;justify-content:end;margin:0;height:28px"><a href="https://padlet.com?ref=embed" style="display:block;flex-grow:0;margin:0;border:none;padding:0;text-decoration:none" target="_blank"><div style="display:flex;align-items:center;"><img src="https://padlet.net/embeds/made_with_padlet_2022.png" width="114" height="28" style="padding:0;margin:0;background:0 0;border:none;box-shadow:none" alt="Made with Padlet"></div></a></div></div>'),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 30,
                child: Container(
                  color: primaryC,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Menu2(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutPage()));
                          },
                          icon: '15.png',
                          label: 'Kiri'),
                      Menu2(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutPage()));
                          },
                          icon: '16.png',
                          label: 'Kanan'),
                      Menu2(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutPage()));
                          },
                          icon: '17.png',
                          label: 'Refresh'),
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
              ),
            ],
          ),
        ),
      )),
    );
  }
}
