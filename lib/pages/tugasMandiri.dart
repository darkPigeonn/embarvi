import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/layout.dart';
import 'package:embarvi/pages/materi/materi1/materiPembelajaran.dart';
import 'package:embarvi/pages/quiz/quiz.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TugasMandiri extends StatefulWidget {
  final int code;
  const TugasMandiri({super.key, required this.code});

  @override
  State<TugasMandiri> createState() => _TugasMandiriState();
}

class _TugasMandiriState extends State<TugasMandiri> {
  List content = [
    "Setelah selesai membaca materi di kegiatan pembelajaran 1 (sejarah, ciri, struktur dan bentuk virus) secara mandiri di rumah, cobalah peserta didik untuk mengerjakan tugas mandiri ini dengan seksama.",
    "Soal yang terdapat pada tugas mandiri ini terdiri atas 3 butir soal yang berbentuk uraian.",
    "Gunakanlah e-module atau sumber relevan lainnya untuk menjawab butir-butir soal.",
    "Isilah identitas dan jawaban pada kolom yang telah disediakan.",
    "Klik mulai untuk mengerjakan dan klik kirim apabila telah selesai mengerjakannya."
  ];
  List content2 = [
    "Setelah selesai membaca materi di kegiatan pembelajaran 2 (cara hidup, replikasi dan peranan virus) secara mandiri di rumah, cobalah peserta didik untuk mengerjakan tugas mandiri ini dengan seksama.",
    "Soal yang terdapat pada tugas mandiri ini terdiri atas 4 butir soal yang berbentuk uraian.",
    "Gunakanlah e-module atau sumber relevan lainnya untuk menjawab butir-butir soal.",
    "Isilah identitas dan jawaban pada kolom yang telah disediakan.",
    "Klik mulai untuk mengerjakan dan klik kirim apabila telah selesai mengerjakannya."
  ];

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
                title: 'TUGAS MANDIRI',
              ),
              Spacing2,
              Text(
                'Petunjuk Pengerjaan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                    itemCount:
                        widget.code == 1 ? content.length : content2.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BulletNumber(
                        text:
                            widget.code == 1 ? content[index] : content2[index],
                        number: '${index + 1} ',
                      );
                    }),
              ),
              Spacing3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                        'assets/images/icons/14.png',
                        width: 30, // Sesuaikan ukuran gambar jika perlu
                        height: 30, // Sesuaikan ukuran gambar jika perlu
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Link Tugas Mandiri 1: https://forms.gle/tPyEVUJDQuo3PEPR6 Link Tugas Mandiri 2: https://forms.gle/HK2sctDpArjhXj8f9
                      var link = '''https://forms.gle/tPyEVUJDQuo3PEPR6''';
                      if (widget.code != 1) {
                        link = "https://forms.gle/HK2sctDpArjhXj8f9";
                      }
                      final uri = Uri.parse(link);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
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
