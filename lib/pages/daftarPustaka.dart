import 'package:flutter/material.dart';

class BibliographyPage extends StatelessWidget {
  final List references = [
    "Akmal, M. P. (2022). Virus dan Peranannya: Materi Ajar IPA Biologi Fase E, Kelas X. Akmal's Library.",
    "Belsham, G. J., Botner, A., & Lohse, L. (2021). Foot and Mouth Disease in Animal. MSD Veterinary Manual. 1-9.",
    "Boy, E. (2022). Kesehatan Lingkungan. Medan: UMSU Press.",
    "Buckley, D. H., Madigan, M. T., Martino, J. M., Bender, K. S., Sattley, W., & Stahl, D. (2015). Brock Biology of Microorganisms. United States of America: Pearson.",
    "Campbell, N. A., & J. B. Reece. (2021). Biologi Edisi Kedelapan Jilid 3 Terjemahan: Damaring Tyas Wulandari. Jakarta: Erlangga.",
    "Endersen, L., & Coffey, A. (2020). The Use of Bacteriophages for Food Safety. Current Opinion in Food Science. 36, 1-8. https://doi.org/10.1016/j.cofs.2020.10.006.",
    "Generalov, L. (2016). Medical Bacteriology & Virology. Vitebsk: Vitebsk State Medical University.",
    "Hill, C. (2019). Bacteriophages: Viruses that Infect Bacteria. Front Young Minds. 7 :146. Doi:10.3389/frym.2019.00146.",
    "Jacob, S. T., Crozier, I., Fischer, W. A., Hewlett, A., Kraft, C. S., Vega, M. A. D. L., & Kuhn, J. H. (2020). Ebola Virus Disease. Nature reviews Disease Primers. 6(1), 13. https://doi.org/10.1038/s41572-020-0147-3.",
    "Karasneh, G. A., & Shukla, D. (2011). Herpes Simplex Virus Infects Most Cell Types in Vitro: Clues to its Success. Virology Journal. 8(4), 1-11. doi:10.1186/1743-422x-8-481.",
    "Kis, Z., Shattock, R., Shah, N., & Kontoravdi, C. (2019). Emerging Technologies for Low‐Cost, Rapid Vaccine Manufacture. Biotechnology Journal. 14(1), 1-10. https://doi.org/10.1002/biot.201800376.",
    "Lee, H. R., Jung, J., Riu, M., & Ryu, C. M. (2017). A New Frontier for Biological Control Against Plant Pathogenic Nematodes and Insect Pests I: by Microbes. Research in Plant Disease. 23(2), 114-149.",
    "Levani, P., & Mawaddatunnadila (2021). Coronavirus Disease 2019 (COVID-19): Patogenesis, Manifestasi Klinis dan Pilihan Terapi. Jurnal Kedokteran dan Kesehatan. 17(1), 44-57. https://doi.org/10.24853/jkk.17.1.44-57.",
    "Li, C., & Samulski, R. J. (2020). Engineering Adeno-Associated Virus Vectors for Gene Therapy. Nature Reviews Genetics. 21(4), 255-272. https://doi.org/10.1038/s41576-019-0205-4.",
    "Louten J. (2016). Virus Structure and Classification. Essential. Human Virology. 19–29. https://doi.org/10.1016/B978-0-12-800947-5.00002-8.",
    "Nishiura, H. (2019). Estimating the Incidence and Diagnosed Proportion of HIV Infections in Japan: A Statistical Modeling Study. PeerJ. 1-18 https://doi.org/10.7717/peerj.6275.",
    "Pratiwi., Maryati, Sri., Srikini., Suharno., & Suseno, Bambang. (2014). Biologi untuk SMA/MA Kelas X Kelompok Peminatan Matematika dan Ilmu Alam. Jakarta: Erlangga.",
    "Prayitno, T. N., & Hidayati, N. (2017). Pengantar Mikrobiologi. Malang: Media Nusa Creative.",
    "Puspaningsih, R. A. Elizabeth, T., & Niken, R. K. (2021). Ilmu Pengetahuan Alam untuk SMA Kelas X. Pusat Kurikulum dan Perbukuan Badan Penelitian dan Pengembangan dan Perbukuan Kementerian Pendidikan, Kebudayaan, Riset dan Teknologi Jalan Gunung Sahari Raya No. 4 Jakarta Pusat.",
    "Reece, J. B. & Meyers, Noel. & Urry, Lisa A. & Cain, Michael L. & Wasserman, Steven A. & Minorsky, Peter V. & Jackson, Robert B. & Cooke, Bernard J. Campbell, Neil A. (2021). Campbell Biology Twelfth Edition. Frenchs Forest, NSW: Pearson.",
    "Setyaningrum, P. M. P., Ramli, M., & Rinanto, Y. (2018). Profil Pemahaman Konsep Siswa SMA tentang Virus. UNY PRESS. 93-104.",
    "Siagian, R. (2023). Pengaruh Penyuluhan Pendidikan Kesehatan tentang HIV/AIDS Terhadap Pengetahuan Siswa Kelas X di SMA Namira Medan Tahun 2022. DIAGNOSA: Jurnal Ilmu Kesehatan dan Keperawatan. 1(2), 260-268. https://doi.org/10.59581/diagnosa-widyakarya.v1i2.1327.",
    "Solomon, E. P., Berg, L. R., & Martin, E. M. (2019). Biology 11 th ed. Cengage: Brooks.",
    "Suhara, C., & Hidayah, N. (2020). Resistensi Galur-Galur Tembakau Kasturi Terhadap Phytophthora Nicotianae, Ralstonia Solanacearum dan Cucumber Mosaic Virus. Buletin Tanaman Tembakau, Serat dan Minyak Industri. 12(1), 22-33. DOI: 10.21082/btsm.v12n1.2020.22−33.",
    "Sutrawati, M., Sariasih, Y., & Priyatiningsih, F. T. (2019). Deteksi Virus Tungro pada Padi di Bengkulu. Jurnal Ilmu-Ilmu Pertanian Indonesia. 21(2), 99-102.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daftar Pustaka'),
        ),
        // body: DynamicMarginText(
        //   text:
        //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        // ));
        body: ListView.builder(
          itemCount: references.length,
          itemBuilder: (context, index) {
            final reference = references[index];
            return ListTile(title: DynamicMarginText(text: reference));
          },
        ));
    // body: RichText(
    //   text: TextSpan(
    //     children: [
    //       TextSpan(
    //         text:
    //             'Mempelajari materi virus ini, peserta didik dapat memahami bahwa virus sebagai makhluk hidup yang ukurannya sangat kecil (mikroskopis).',
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 16,
    //         ),
    //       ),
    //       WidgetSpan(
    //         alignment: PlaceholderAlignment.middle,
    //         child: SizedBox(width: 10), // Margin kiri 5
    //       ),
    //     ],
    //   ),
    // ));
  }
}

class DynamicMarginText extends StatelessWidget {
  final String text;
  static const double fontSize = 16.0;

  const DynamicMarginText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = 1500;

        // Split the text into words
        final List<String> words = text.split(' ');

        // Initialize variables to track line width and current line
        double lineWidth = 0;
        String currentLine = '';
        bool isFirstLine = true;

        // Initialize a list to store text widgets with margin
        List<Widget> textWidgets = [];

        // Loop through each word to build text widgets with margin
        for (int i = 0; i < words.length; i++) {
          final String word = words[i];

          // Create a text span for the current word
          final TextPainter textPainter = TextPainter(
            text: TextSpan(
              text: '$currentLine $word'.trim(),
              style: TextStyle(fontSize: fontSize),
            ),
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: maxWidth);

          // Check if adding the current word exceeds the available width
          if (lineWidth + textPainter.width > maxWidth) {
            // Add the text widget with margin to the list
            textWidgets.add(Container(
              margin:
                  isFirstLine ? EdgeInsets.zero : EdgeInsets.only(left: 25.0),
              child: Text(
                currentLine.trim(),
                style: TextStyle(fontSize: fontSize),
                textAlign: TextAlign.justify, // Justify text
              ),
            ));

            // Reset line width and current line for the new line
            lineWidth = 0;
            currentLine = '';
            isFirstLine = false;
          }

          // Add the current word to the current line
          currentLine += ' $word';

          // Update the line width
          lineWidth += textPainter.width;
        }

        // Add the last line
        textWidgets.add(Container(
          margin: isFirstLine ? EdgeInsets.zero : EdgeInsets.only(left: 25.0),
          child: Text(
            currentLine.trim(),
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.justify, // Justify text
          ),
        ));

        // Return the column of text widgets
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: textWidgets,
        );
      },
    );
  }
}
