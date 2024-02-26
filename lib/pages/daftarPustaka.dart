import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BibliographyPage extends StatefulWidget {
  const BibliographyPage({super.key});

  @override
  State<BibliographyPage> createState() => _BibliographyPageState();
}

class _BibliographyPageState extends State<BibliographyPage> {
  late final WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse(
          "https://darkpigeonn.github.io/ar-view-node/public/content/daftarPustaka.html"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryC,
        body: Column(
          children: [
            Spacing2,
            Container(
                margin: marginPrimary,
                child: TitlePage(title: 'Daftar Pustaka')),
            Expanded(child: WebNew(controller: controller)),
          ],
        ),
      ),
    );
  }
}

class WebNew extends StatelessWidget {
  const WebNew({
    super.key,
    required this.controller,
  });

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}
