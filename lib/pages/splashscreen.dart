import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/home.dart';
import 'package:embarvi/pages/layout.dart';
import 'package:embarvi/pages/services/userController.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/textStlyLib.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  TextEditingController name = TextEditingController();
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
                Spacing3,
                Text(
                  'Yuk isi kolom identitas untuk \n login EMBARVI',
                  textAlign: TextAlign.center,
                ),
                Spacing3,
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: name,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Nama : .....',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Spacing3,
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (name.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text("Silahkan menulis nama terlebih dahulu"),
                        ));
                      } else {
                        await saveData(name.text);
                        Future.delayed(Durations.short1);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LayoutPage()));
                      }
                    },
                    child: Container(
                      width: 190,
                      height: 60,
                      decoration: BoxDecoration(
                          color: bPrimary,
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person_rounded,
                                color: bPrimary,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
