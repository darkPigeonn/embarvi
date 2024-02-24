import 'package:embarvi/utils/colorLib.dart';
import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: titleCardC, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TitlePageMateri extends StatelessWidget {
  final String title;
  const TitlePageMateri({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: titleCardC, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
