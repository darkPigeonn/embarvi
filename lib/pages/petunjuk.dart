import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/menu.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
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
      backgroundColor: primaryC,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: primaryC,
              margin: marginPrimary,
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
                    margin: EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                        itemCount: content.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return content[index]['type'] == 'text'
                              ? RichTextCustom(
                                  content: content[index]['detail'])
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
                    iconData: '1.png',
                    textbold: 'Menu Pendahuluan',
                    text:
                        ' berisikan penjelasan secara singkat tujuan dikembangkannya aplikasi EMBARVI ini. ',
                  ),
                  const TabelPetunjuk(
                    label: 'Indikator',
                    iconData: '2.png',
                    textbold: 'Menu Indikator',
                    text:
                        ' berisikan kompetensi awal, profil pelajar pancasila, sarana dan prasarana, capaian pembelajaran, serta tujuan pembelajaran.',
                  ),
                  const TabelPetunjuk(
                    label: 'Peta Konsep',
                    iconData: '3.png',
                    textbold: 'Menu Peta Konsep',
                    text:
                        ' berisikan gambaran mengenai materi yang disajikan pada EMBARVI. ',
                  ),
                  const TabelPetunjuk(
                    label: 'Materi dan Ar', //perlu khusus
                    iconData: '4.png',
                    textbold: 'Menu Materi dan Ar (<i>Augmented Reality</i>)',
                    text:
                        ' berisikan uraian materi yang dilengkapi dengan AR dan rangkuman materi untuk mempermudah pemahaman peserta didik. \n<b>Catatan</b>: Gambar 3D (AR) hanya terdapat pada sub materi struktur dan bentuk, cara hidup, serta replikasi virus. ',
                  ),
                  const TabelPetunjuk(
                    label: 'LPKD', //perlu khusus
                    iconData: '5.png',
                    textbold: 'Menu LPKD',
                    text:
                        ' berisikan lembar kerja peserta didik (LKPD) yang dapat diunduh dan dikerjakan oleh peserta didik pada saat kegiatan pembelajaran di kelas.',
                  ),
                  const TabelPetunjuk(
                    label: 'Diskusi', //perlu khusus
                    iconData: '6.png',
                    textbold: 'Menu Diskusi',
                    text:
                        ' berisikan fasilitas yang disediakan kepada peserta didik untuk melakukan diskusi antar peserta didik ataupun dengan guru. ',
                  ),
                  const TabelPetunjuk(
                    label: 'Pustaka', //perlu khusus
                    iconData: '7.png',
                    textbold: 'Menu Pustaka',
                    text:
                        ' berisikan sumber referensi yang digunakan dalam menyusun materi virus. ',
                  ),
                  const TabelPetunjuk(
                    label: 'Glosarium', //perlu khusus
                    iconData: '8.png',
                    textbold: 'Menu Glosarium',
                    text:
                        ' berisikan beberapa kata atau istilah penting mengenai materi virus.  ',
                  ),
                  const TabelPetunjuk(
                    label: 'Pengembang', //perlu khusus
                    iconData: '9.png',
                    textbold: 'Menu Pengembang',
                    text:
                        ' berisikan informasi mengenai aplikasi, pengembang dan dosen pembimbing.  ',
                  ),
                  Spacing1,
                  // Container(
                  //   child: Text(pendahuluan['content'].toString()),
                  // )
                ],
              ),
            ),
          ),
          Stack(
            children: [BottomNavigationCustom()],
          )
        ],
      )),
    );
  }
}

class TabelPetunjuk extends StatelessWidget {
  final String label;
  final String iconData;
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
            child: RichTextCustom2(
              content: text,
              label: textbold,
            ),
          )
        ],
      ),
    );
  }
}
