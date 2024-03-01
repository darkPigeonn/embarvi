import 'package:embarvi/Components/buttonC.dart';
import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/indikator.dart';
import 'package:embarvi/pages/layout.dart';
import 'package:embarvi/pages/materi.dart';
import 'package:embarvi/pages/quiz/quiz.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';

class FormatifPage extends StatefulWidget {
  const FormatifPage({super.key});

  @override
  State<FormatifPage> createState() => _FormatifPageState();
}

class _FormatifPageState extends State<FormatifPage> {
  List content = indikator['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryC,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: marginPrimary,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing2,
              TitlePage(
                title: 'FORMATIF',
              ),
              Spacing2,
              Text(
                'Petunjuk Penggunaan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              BulletNumber(
                text:
                    'Setelah selesai melakukan pembelajaran pada materi virus, cobalah peserta didik untuk mengerjakan tes formatif sebagai bentuk dari kegiatan evaluasi pembelajaran guna mengetahui tingkat pemahaman terhadap materi. ',
                number: '1',
              ),
              BulletNumber(
                text:
                    'Soal tes formatif (evaluasi pembelajaran) ini berjumlah 15 soal dalam bentuk pilihan ganda yang harus peserta didik kerjakan.',
                number: '2',
              ),
              BulletNumber(
                text:
                    'Pilihlah jawaban yang benar menurut peserta didik dengan menekan pilihan jawaban (a/b/c/d/e). ',
                number: '3',
              ),
              BulletNumber(
                text:
                    'Apabila sudah selesai mengerjakan soal, maka nilai akan langsung muncul di akhir. ',
                number: '4',
              ),
              Spacing3,
              Center(
                child: Text('_Selamat Mengerjakan_'),
              ),
              Spacing3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LayoutPage()));
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Warna latar belakang putih
                      ),
                      child: Image.asset(
                        'assets/images/icons/11.png',
                        width: 30, // Sesuaikan ukuran gambar jika perlu
                        height: 30, // Sesuaikan ukuran gambar jika perlu
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuisPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Text('Mulai'),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: bPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
