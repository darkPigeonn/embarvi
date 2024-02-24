import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/materi/materi1/rangkuman.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class MateriPembelajaran extends StatefulWidget {
  final Map content;
  final int code;
  const MateriPembelajaran(
      {super.key, required this.content, required this.code});

  @override
  State<MateriPembelajaran> createState() => _MateriPembelajaranState();
}

class _MateriPembelajaranState extends State<MateriPembelajaran> {
  @override
  Widget build(BuildContext context) {
    List content = widget.content['content'] as List;
    return Scaffold(
      backgroundColor: primaryC,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: marginPrimary,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing2,
              TitlePage(
                title: widget.content['title'].toString(),
              ),
              Spacing2,
              ListView.builder(
                  itemCount: content.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return content[index]['type'] == 'text'
                        ? RichTextCustom(
                            content: content[index]['detail'].toString())
                        : content[index]['type'] == 'bullet'
                            ? BulletItem2(text: content[index]['detail'])
                            : content[index]['type'] == 'youtube'
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top: 15),
                                    color: const Color.fromARGB(255, 0, 49, 88),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                            child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            content[index]['detail'],
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/youtube.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : content[index]['type'] == 'info'
                                    ? Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 50),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 15),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 239, 227, 186),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              content[index]['detail'],
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  height: 1.5),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              width: 140,
                                              margin: EdgeInsets.only(top: 20),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6998AB),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                content[index]['label'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : content[index]['type'] == 'buttons'
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: bPrimary),
                                            onPressed: () {
                                              Map dataContent = {};
                                              if (widget.code == 1) {
                                                dataContent = rangkuman_materi1;
                                              } else {
                                                dataContent = rangkuman_materi2;
                                              }
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RangkumanPage(
                                                            content:
                                                                dataContent,
                                                          )));
                                            },
                                            child:
                                                Text(content[index]['detail']))
                                        : content[index]['type'] == 'textBold'
                                            ? SubTitleBold(
                                                label: content[index]['detail'],
                                              )
                                            : content[index]['type'] ==
                                                    'textBoldContent'
                                                ? Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    child: RichText(
                                                      textAlign:
                                                          TextAlign.justify,
                                                      text: TextSpan(
                                                        style: const TextStyle(
                                                            height: 1.6),
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
                                                            text: content[index]
                                                                    ['detail']
                                                                .toString(),
                                                            style: DefaultTextStyle
                                                                    .of(context)
                                                                .style,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : content[index]['type'] ==
                                                        'images'
                                                    ? ImagesSingle(
                                                        content: content[index])
                                                    : content[index]['type'] ==
                                                            'imagesMulti'
                                                        ? ImagesMulti(
                                                            content:
                                                                content[index])
                                                        : content[index]
                                                                    ['type'] ==
                                                                'table'
                                                            ? TableImage(
                                                                content:
                                                                    content[
                                                                        index])
                                                            : content[index][
                                                                        'type'] ==
                                                                    'subTitle2'
                                                                ? SubTitle2(
                                                                    label: content[
                                                                            index]
                                                                        [
                                                                        'detail'])
                                                                : SubTitle(
                                                                    label: content[
                                                                            index]
                                                                        [
                                                                        'detail'],
                                                                  );
                    // return Text(content[0].toString(),
                    //     textAlign: TextAlign.justify,
                    //     style: TextStyle(height: 1.8));
                  }),
              Spacing3
            ],
          ),
        ),
      )),
    );
  }
}

class ImagesSingle extends StatefulWidget {
  const ImagesSingle({
    super.key,
    required this.content,
  });

  final Map content;

  @override
  State<ImagesSingle> createState() => _ImagesSingleState();
}

class _ImagesSingleState extends State<ImagesSingle> {
  formatName(String name) {
    return 'Gambar ${name.split('_')[2].split('.')[0]}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 250,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 217, 196, 136),
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatName(widget.content['name']) + ' : ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Flexible(
                    child: Text(
                      '${widget.content['label']}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InstaImageViewer(
            child:
                Image.asset('assets/images/materi/${widget.content['name']}'))
      ],
    );
  }
}

class ImagesMulti extends StatefulWidget {
  const ImagesMulti({
    super.key,
    required this.content,
  });

  final Map content;

  @override
  State<ImagesMulti> createState() => _ImagesMultiState();
}

class _ImagesMultiState extends State<ImagesMulti> {
  formatName(String name) {
    return 'Gambar ${name.split('_')[2].split('.')[0]}';
  }

  formatNameTable(String name) {
    return 'Tabel ${name.split('_')[2].split('.')[0]} .';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: widget.content['Sumber2'] == '-'
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceAround,
        children: [
          itemImages(
            name: widget.content['name1'],
            label: widget.content['label1'],
            sumber: widget.content['Sumber1'],
            imageLabel: formatName(widget.content['name1']),
          ),
          widget.content['Sumber2'] != '-'
              ? itemImages(
                  name: widget.content['name2'],
                  label: widget.content['label2'],
                  sumber: widget.content['Sumber2'],
                  imageLabel: widget.content['Sumber2'] != '-'
                      ? formatName(widget.content['name2'])
                      : formatNameTable(widget.content['name2']))
              : Container()
        ],
      ),
    );
  }
}

class TableImage extends StatefulWidget {
  const TableImage({
    super.key,
    required this.content,
  });

  final Map content;

  @override
  State<TableImage> createState() => _TableImageState();
}

class _TableImageState extends State<TableImage> {
  formatName(String name) {
    return 'Tabel ${name.split('_')[2].split('.')[0]}. ';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 250,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 217, 196, 136),
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatName(widget.content['name']),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Text(
                    ' ${widget.content['label']}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InstaImageViewer(
            child:
                Image.asset('assets/images/materi/${widget.content['name']}'))
      ],
    );
  }
}

class itemImages extends StatelessWidget {
  const itemImages({
    super.key,
    required this.name,
    required this.label,
    required this.sumber,
    required this.imageLabel,
  });
  final String imageLabel;
  final String name;
  final String label;
  final String sumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sumber == '-'
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 196, 136),
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          imageLabel,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          ' $label',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
        InstaImageViewer(
            child: Container(
          margin: EdgeInsets.only(bottom: 15, top: 15),
          child: ClipRRect(
              child: Image.asset(
            'assets/images/materi/$name',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          )),
        )
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   height: MediaQuery.of(context).size.width * 0.4,
            //   margin: EdgeInsets.symmetric(
            //     vertical: 10,
            //   ),
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            ),
        sumber != '-'
            ? Container(
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 196, 136),
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            '$imageLabel : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '$label',
                            style: TextStyle(fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 2),
                          child: Text(
                            'Sumber : ',
                            style: TextStyle(fontSize: 9),
                          ),
                        ),
                        // Text(
                        //   ' : $sumber',
                        //   style: TextStyle(fontSize: 9),
                        // ),
                        RichTextCustomLabel(content: sumber)
                      ],
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}

class BulletItem extends StatelessWidget {
  final String text;
  const BulletItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          height: 1.6,
          fontSize: 17.0,
          color: Colors.black,
        ),
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.circle,
                size: 10.0,
                color: Colors.black,
              ),
            ),
          ),
          TextSpan(
            text: '$text',
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class BulletItem2 extends StatelessWidget {
  final String text;
  const BulletItem2({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // return RichText(
    //   text: TextSpan(
    //     style: const TextStyle(
    //       height: 1.6,
    //       fontSize: 14.0,
    //       color: Colors.black,
    //     ),
    //     children: [
    //       const WidgetSpan(
    //         alignment: PlaceholderAlignment.middle,
    //         child: Padding(
    //           padding: EdgeInsets.only(right: 5.0),
    //           child: Icon(
    //             Icons.circle,
    //             size: 10.0,
    //             color: Colors.black,
    //           ),
    //         ),
    //       ),
    //       TextSpan(
    //         text: '$text',
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0, top: 6),
            child: Icon(
              Icons.circle,
              size: 10.0,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: Text(
              '$text',
              style: TextStyle(height: 1.5, fontSize: 17),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class BulletNumber extends StatelessWidget {
  final String text;
  final String number;
  const BulletNumber({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text('$number.', style: TextStyle(height: 1.6))),
          Flexible(
              child: Text(
            '$text',
            textAlign: TextAlign.justify,
            style: TextStyle(
              height: 1.6,
            ),
          ))
        ],
      ),
    );
  }
}
