import 'package:embarvi/utils/textStlyLib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'EMBARVI',
          style: title,
        ),
        Column(
          children: [
            Text(
              'E-Module Berbantuan',
            ),
            Text(
              'Augmented Reaality',
            ),
            Text(
              'Materi Virus',
            ),
          ],
        ),
      ],
    );
  }
}

class SubTitle extends StatelessWidget {
  final String label;
  const SubTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
