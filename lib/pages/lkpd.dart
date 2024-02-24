import 'package:embarvi/Components/buttonC.dart';
import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/materi.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LkpdPage extends StatefulWidget {
  const LkpdPage({super.key});

  @override
  State<LkpdPage> createState() => _LkpdPageState();
}

class _LkpdPageState extends State<LkpdPage> {
  List content = indikator['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: primaryC,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Spacing2,
                  const TitlePage(
                    title: 'Lembar Kerja Peserta Didik',
                  ),
                  Spacing1,
                  Spacing3,
                  Button1(
                      onPressed: () async {
                        final link =
                            'https://www.canva.com/design/DAF7sopAx-s/nQnILPPu43NbK8lqfXkHXQ/edit?utm_content=DAF7sopAx-s&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton';
                        final uri = Uri.parse(link);
                        if (await canLaunchUrl(uri)) {
                          print('disini');
                          await launchUrl(uri,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      icon: Icons.download,
                      label: 'Unduh LKPD Pertemuan 1'),
                  Spacing2,
                  Button2(
                      onPressed: () async {
                        final link =
                            'https://www.canva.com/design/DAF5jrfrkoE/sTTbHfatNLq1TL2sdjlEMA/edit?utm_content=DAF5jrfrkoE&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton';
                        final uri = Uri.parse(link);
                        if (await canLaunchUrl(uri)) {
                          ;
                          await launchUrl(uri,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      icon: Icons.download,
                      label: 'Unduh LKPD Pertemuan 2')
                ],
              ),
            ),
          ),
          BottomBack()
        ],
      )),
    );
  }
}
