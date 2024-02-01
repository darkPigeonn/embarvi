import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/home.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/textStlyLib.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: primaryC,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Spacing1,
                Text(
                  'Selamat Datang',
                  style: title,
                ),
                Spacing2,
                Text(
                  'EMBARVI',
                  style: subTitle,
                ),
                Text(
                  'E-MODULE BERBANTUAN AUGMENTED REALITY',
                  style: subTitle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'MATERI VIRUS',
                  style: subTitle,
                ),
                Image.asset(
                  'assets/images/spimage.png',
                  scale: 2,
                ),
                Text(
                  'Yuk isi kolom identitas untuk \n login EMBARVI',
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text('Masuk'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
