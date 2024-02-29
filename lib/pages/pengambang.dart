import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: primaryC,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: marginPrimary,
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
                    img: 'assets/images/sandi.png',
                    name: 'Retno Sandi Saputra, S.Pd',
                    description:
                        'Merupakan mahasiswa yang sedang menempuh Program Studi Magister Pendidikan Biologi di Universitas Negeri Yogyakarta. Aplikasi EMBARVI ini merupakan produk akhir Tesis yang bertujuan untuk membantu peserta didik kelas X (Fase E) dalam mempelajari materi virus. Semoga produk yang sederhana ini dapat bermanfaat bagi semua.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              'https://www.instagram.com/sandysaputra__/'));
                        },
                        child: CircleAvatar(
                          child: Image.asset('assets/images/icons/ig.png'),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              'https://api.whatsapp.com/send?phone=6285727769420'));
                        },
                        child: CircleAvatar(
                          child: Image.asset('assets/images/icons/wa.png'),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          Uri(
                            scheme: 'mailto',
                            path: 'retnosandi.2022@student.uny.ac.id',
                            queryParameters: {
                              'subject': 'Hello from Flutter',
                              // Tambahkan parameter lain sesuai kebutuhan, seperti body
                            },
                          );
                          launchUrl(Uri(
                            scheme: 'mailto',
                            path: 'retnosandi.2022@student.uny.ac.id',
                            queryParameters: {
                              'subject': 'Hello from Flutter',
                              // Tambahkan parameter lain sesuai kebutuhan, seperti body
                            },
                          ));
                        },
                        child: CircleAvatar(
                          child: Image.asset('assets/images/icons/email.png'),
                        ),
                      ),
                    ],
                  ),
                  Spacing2,
                  Personal(
                      img: 'assets/images/dosen.png',
                      name: 'Dr. Dra. Bernadetta Octavia, M.Si',
                      description:
                          'Merupakan Dosen Pembimbing Tesis sekaligus sebagai Dosen Jurusan Pendidikan Biologi, Fakultas Matematika dan Ilmu Pengetahuan Alam, Universitas Negeri Yogyakarta.'),
                  Spacing1,
                ],
              ),
            ),
          ),
          BottomNavigationCustom()
        ],
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
        Image.asset(
          img,
          height: 150,
          width: 150,
        ),
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
