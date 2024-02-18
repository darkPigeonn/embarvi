import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:flutter/material.dart';

class PetunjukPage extends StatefulWidget {
  const PetunjukPage({super.key});

  @override
  State<PetunjukPage> createState() => _PetunjukPageState();
}

class _PetunjukPageState extends State<PetunjukPage> {
  List content = petunjuk['content'] as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: primaryC,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Spacing3,
              TitlePage(
                title: petunjuk['title'].toString(),
              ),
              Spacing3,
              Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                    itemCount: content.length,
                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return content[index]['type'] == 'text'
                          ? RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: const TextStyle(height: 1.6),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '\ t', // Tambahkan spasi tambahan di antara karakter tab dan teks
                                    style: TextStyle(
                                      height: 2,
                                      fontSize:
                                          16, // Sesuaikan ukuran teks sesuai kebutuhan
                                    ),
                                  ),
                                  TextSpan(
                                    text: content[index]['detail'].toString(),
                                    style: DefaultTextStyle.of(context).style,
                                  ),
                                ],
                              ),
                            )
                          : SubTitle(
                              label: content[index]['detail'],
                            );
                      // return Text(content[0].toString(),
                      //     textAlign: TextAlign.justify,
                      //     style: TextStyle(height: 1.8));
                    }),
              ),

              const TabelPetunjuk(
                label: 'Pendahuluan',
                iconData: Icons.message,
                textbold: 'Menu Pendahuluan',
                text:
                    ' berisikan penjelasan secara singkat tujuan dikembangkannya aplikasi EMBARVI ini. ',
              ),
              const TabelPetunjuk(
                label: 'Indikator',
                iconData: Icons.settings,
                textbold: 'Menu Indikator',
                text:
                    ' berisikan kompetensi awal, profil pelajar pancasila, sarana dan prasarana, capaian pembelajaran, serta tujuan pembelajaran.',
              ),
              const TabelPetunjuk(
                label: 'Peta Konsep',
                iconData: Icons.maps_ugc_sharp,
                textbold: 'Menu Peta Konsep',
                text:
                    ' berisikan gambaran mengenai materi yang disajikan pada EMBARVI. ',
              ),
              const TabelPetunjuk(
                label: 'Materi dan Ar', //perlu khusus
                iconData: Icons.book,
                textbold: 'Menu Materi dan Ar (<i>Augmented Reality</i>)',
                text:
                    ' berisikan uraian materi yang dilengkapi dengan AR dan rangkuman materi untuk mempermudah pemahaman peserta didik. \nCatatan: Gambar 3D (AR) hanya terdapat pada sub materi struktur dan bentuk, cara hidup, serta replikasi virus. ',
              ),
              const TabelPetunjuk(
                label: 'LPKD', //perlu khusus
                iconData: Icons.bookmark_added_rounded,
                textbold: 'Menu LPKD',
                text:
                    ' berisikan lembar kerja peserta didik (LKPD) yang dapat diunduh dan dikerjakan oleh peserta didik pada saat kegiatan pembelajaran di kelas.',
              ),
              const TabelPetunjuk(
                label: 'Diskusi', //perlu khusus
                iconData: Icons.leaderboard,
                textbold: 'Menu Diskusi',
                text:
                    ' berisikan fasilitas yang disediakan kepada peserta didik untuk melakukan diskusi antar peserta didik ataupun dengan guru. ',
              ),
              const TabelPetunjuk(
                label: 'Pustaka', //perlu khusus
                iconData: Icons.search,
                textbold: 'Menu Pustaka',
                text:
                    ' berisikan sumber referensi yang digunakan dalam menyusun materi virus. ',
              ),
              const TabelPetunjuk(
                label: 'Glosarium', //perlu khusus
                iconData: Icons.tab_unselected_sharp,
                textbold: 'Menu Glosarium',
                text:
                    ' berisikan beberapa kata atau istilah penting mengenai materi virus.  ',
              ),
              const TabelPetunjuk(
                label: 'Pengembang', //perlu khusus
                iconData: Icons.people,
                textbold: 'Menu Pengembang',
                text:
                    ' berisikan informasi mengenai aplikasi, pengembang dan dosen pembimbing.  ',
              ),

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

class TabelPetunjuk extends StatelessWidget {
  final String label;
  final IconData iconData;
  final String textbold;
  final String text;
  const TabelPetunjuk({
    super.key,
    required this.label,
    required this.iconData,
    required this.textbold,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Menu(
            label: label,
            icon: iconData,
            onPressed: () => null,
          ),
          Flexible(
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: const TextStyle(height: 1.6),
                children: <TextSpan>[
                  TextSpan(
                      text: textbold,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black)),
                  TextSpan(
                      text: text,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
