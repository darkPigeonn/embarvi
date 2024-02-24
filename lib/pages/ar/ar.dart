import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ArPage extends StatefulWidget {
  const ArPage({super.key});

  @override
  State<ArPage> createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HtmlWidget(
          '<iframe src="https://app.vectary.com/p/1EsuXg8QpCBHvWA2P0lOpi" frameborder="0" width="100%" height="480"></iframe>'),
    );
  }
}
