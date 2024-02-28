import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/textStlyLib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.name,
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 30.0, // lebar lingkaran
              height: 30.0, // tinggi lingkaran
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle, // bentuk lingkaran
                color: Colors.transparent, // warna lingkaran
              ),
              child: Icon(Icons.person),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EMBARVI',
                style: titleApp,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'E-Module',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: bPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Berbantuan',
                        style: TextStyle(
                            color: bPrimary, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    'Augmented Reaality',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: bPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Materi Virus',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
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
          width: 300,
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }
}

class SubTitle2 extends StatelessWidget {
  final String label;
  const SubTitle2({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 104, 165, 215)),
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class SubTitleBold extends StatelessWidget {
  final String label;
  const SubTitleBold({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
