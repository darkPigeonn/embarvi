import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:flutter/material.dart';

class PengembangPage extends StatefulWidget {
  const PengembangPage({super.key});

  @override
  State<PengembangPage> createState() => _PengembangPageState();
}

class _PengembangPageState extends State<PengembangPage> {
  List content = pendahuluan['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: primaryC,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Spacing2,
              TitlePage(
                title: 'Tentang Pengembang',
              ),
              Spacing2,
              Personal(
                img: 'assets/images/p1.png',
                name: 'Retno Sandi Saputra, S.Pd',
                description:
                    'Merupakan mahasiswa yang sedang menempuh Program Studi Magister Pendidikan Biologi di Universitas Negeri Yogyakarta. Aplikasi EMBARVI ini merupakan produk akhir Tesis yang bertujuan untuk membantu peserta didik kelas X (Fase E) dalam mempelajari materi virus. Semoga produk yang sederhana ini dapat bermanfaat bagi semua.',
              ),
              Spacing2,
              Personal(
                  img: 'assets/images/p2.png',
                  name: 'Dr. Dra. Bernadetta Octavia, M.Si',
                  description:
                      'Merupakan Dosen Pembimbing Tesis sekaligus sebagai Dosen Jurusan Pendidikan Biologi, Fakultas Matematika dan Ilmu Pengetahuan Alam, Universitas Negeri Yogyakarta.'),

              // Container(
              //   child: Text(pendahuluan['content'].toString()),
              // )
            ],
          ),
        ),
      )),
    );
  }
}

class Personal extends StatelessWidget {
  const Personal({
    super.key,
    required this.img,
    required this.name,
    required this.description,
  });
  final String img;
  final String name;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(img),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
