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
    "Karasneh, G. A., & Shukla, D. (2011). Herpes Simplex Virus Infects Most Cell Types in Vitro: Clues to its Success. Virology Journal. 8(4), 1-11. doi:10.1186/1743-422x-8-481."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pustaka'),
      ),
      body: ListView.builder(
        itemCount: references.length,
        itemBuilder: (context, index) {
          final reference = references[index];
          return ListTile(
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextWithLeftPadding(
                text: reference,
                indentSize: 12.0,
              ),
            ]),
          );
        },
      ),
    );
  }
}

class TextWithLeftPadding extends StatelessWidget {
  final String text;
  final double indentSize;

  TextWithLeftPadding({
    required this.text,
    this.indentSize = 12.0,
  });

  List<String> getLines() {
    return text.split('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        softWrap: true,
        style: Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
