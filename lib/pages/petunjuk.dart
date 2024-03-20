import 'package:embarvi/Components/content.dart';
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
  List content2 = [
    "Berdoalah sebelum memulai kegiatan pembelajaran.",
    "Bacalah menu petunjuk penggunaan dengan seksama.",
    "Bukalah menu indikator untuk mengetahui tujuan pembelajaran yang harus dicapai.",
    "Bukalah menu materi dan AR yang terdiri atas 2 sub materi. Materi 1 mengenai sejarah, ciri, struktur dan bentuk virus. Sedangkan materi 2 mengenai cara hidup, replikasi dan peranan virus.",
    "Pada masing-masing menu materi 1 dan 2 terdapat informasi umum, uraian materi, rangkuman dan tugas mandiri. Klik setiap gambar, tabel dan video untuk memperbesar gambar atau memperoleh informasi.",
    "Manfaatkan waktu sebaik-baiknya untuk memahami setiap materi, supaya peserta didik dapat menjawab semua tugas yang diberikan.",
    "Lakukanlah misi tugas mandiri melalui soal-soal yang disediakan dengan mencari dan menemukan jawaban melalui materi yang terdapat pada <i>e-module</i> atau sumber lain yang relevan.",
    "Diskusikan berbagai hal yang ingin diketahui/pelajari/ulasan terkait pembelajaran pada materi virus melalui forum diskusi yang disediakan.",
    "Bacalah glosarium untuk mengetahui istilah-istilah biologi terkait materi virus.",
    "Setelah selesai mengerjakan tugas mandiri, maka akhiri kegiatan pembelajaran dengan berdoa secara mandiri."
  ];

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
                                  color: content[index]['type'] == 'subTitle2'
                                      ? Colors.yellow
                                      : Color.fromARGB(255, 88, 150, 201),
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
                    iconData: '3.png',
                    textbold: 'Menu Indikator',
                    text:
                        ' berisikan kompetensi awal, profil pelajar pancasila, sarana dan prasarana, capaian pembelajaran, serta tujuan pembelajaran.',
                  ),
                  const TabelPetunjuk(
                    label: 'Peta Konsep',
                    iconData: '4.png',
                    textbold: 'Menu Peta Konsep',
                    text:
                        ' berisikan gambaran mengenai materi yang disajikan pada EMBARVI. ',
                  ),
                  const TabelPetunjuk(
                    label: 'Materi dan Ar', //perlu khusus
                    iconData: '5.png',
                    textbold: 'Menu Materi dan Ar (<i>Augmented Reality</i>)',

                    text:
                        ' berisikan uraian materi yang dilengkapi dengan AR dan rangkuman materi serta tugas mandiri untuk mempermudah pemahaman peserta didik. \n<b>Catatan</b> : Gambar 3D (AR) hanya terdapat pada sub materi struktur dan bentuk, cara hidup, serta replikasi virus. Silahkan klik gambar atau tabel untuk memperbesar gambar atau memperoleh informasi',
                  ),
                  const TabelPetunjuk(
                    label: 'LPKD', //perlu khusus
                    iconData: '6.png',
                    textbold: 'Menu LPKD',
                    text:
                        ' berisikan lembar kerja peserta didik (LKPD) yang dapat diunduh dan dikerjakan oleh peserta didik pada saat kegiatan pembelajaran di kelas.',
                  ),
                  const TabelPetunjuk(
                      label: 'Formatif', //perlu khusus
                      iconData: '7.png',
                      textbold: 'Menu Formatif',
                      text:
                          ' berisikan soal-soal latihan evaluasi pembelajaran yang dapat dikerjakan peserta didik untuk menguji pemahaman terhadap materi virus. '),
                  const TabelPetunjuk(
                    label: 'Diskusi', //perlu khusus
                    iconData: '12.png',
                    textbold: 'Menu Diskusi',
                    text:
                        ' berisikan fasilitas yang disediakan kepada peserta didik untuk melakukan diskusi antar peserta didik ataupun dengan guru. ',
                  ),
                  const TabelPetunjuk(
                    label: 'Pustaka', //perlu khusus
                    iconData: '8.png',
                    textbold: 'Menu Pustaka',
                    text:
                        ' berisikan sumber referensi yang digunakan dalam menyusun materi virus. ',
                  ),
                  const TabelPetunjuk(
                    label: 'Glosarium', //perlu khusus
                    iconData: '9.png',
                    textbold: 'Menu Glosarium',
                    text:
                        ' berisikan beberapa kata atau istilah penting mengenai materi virus.  ',
                  ),
                  const TabelPetunjuk(
                    label: 'Pengembang', //perlu khusus
                    iconData: '10.png',
                    textbold: 'Menu Pengembang',
                    text:
                        ' berisikan informasi mengenai aplikasi, pengembang dan dosen pembimbing.  ',
                  ),

                  SubTitle(
                    label: 'B. Petunjuk Belajar',
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                        itemCount: content2.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 25,
                                  child:
                                      RichTextCustom(content: '${index + 1}.')),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: RichTextCustom(content: content2[index]),
                              ),
                            ],
                          );
                        }),
                  ),

                  Spacing1
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
          Menu3(
            label: label,
            icon: iconData,
            onPressed: () => null,
          ),
          Flexible(
            child: RichTextCustomPetunjuk(
              content: text,
              label: textbold,
            ),
          )
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String label;
  final Color color;
  const SubTitle({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
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
