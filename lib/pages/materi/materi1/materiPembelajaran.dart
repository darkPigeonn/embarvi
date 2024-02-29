import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/header.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/helpers/textFungtions.dart';
import 'package:embarvi/pages/ar/ar.dart';
import 'package:embarvi/pages/materi/materi1/arView.dart';
import 'package:embarvi/pages/materi/materi1/rangkuman.dart';
import 'package:embarvi/pages/pendahuluan.dart';
import 'package:embarvi/pages/petaKonsep.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/textStlyLib.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: Stack(
        children: [
          SingleChildScrollView(
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
                            ? Container(
                                child: RichTextCustom(
                                    content:
                                        content[index]['detail'].toString()),
                              )
                            : content[index]['type'] == 'bullet'
                                ? BulletItem2(text: content[index]['detail'])
                                : content[index]['type'] == 'youtube'
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(top: 15),
                                        color: const Color.fromARGB(
                                            255, 0, 49, 88),
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
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Text(
                                                content[index]['detail'],
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    content[index]['link']));
                                              },
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
                                                  margin: EdgeInsets.only(
                                                      top: 50, bottom: 20),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 15),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 239, 227, 186),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: RichTextCustom(
                                                    content: content[index]
                                                        ['detail'],
                                                  )),
                                              Center(
                                                child: Container(
                                                  width: 140,
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 15),
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
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : content[index]['type'] == 'buttons'
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 100),
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                bPrimary),
                                                    onPressed: () {
                                                      Map dataContent = {};
                                                      if (widget.code == 1) {
                                                        dataContent =
                                                            rangkuman_materi1;
                                                      } else {
                                                        dataContent =
                                                            rangkuman_materi2;
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
                                                    child: Text(content[index]
                                                        ['detail'])),
                                              )
                                            : content[index]['type'] ==
                                                    'textBold'
                                                ? SubTitleBold(
                                                    label: content[index]
                                                        ['detail'],
                                                  )
                                                : content[index]['type'] ==
                                                        'textBoldContent'
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15),
                                                        child: RichTextCustom(
                                                          content:
                                                              content[index]
                                                                  ['detail'],
                                                        ))
                                                    : content[index]['type'] ==
                                                            'images'
                                                        ? ImagesSingle(
                                                            content:
                                                                content[index])
                                                        : content[index]
                                                                    ['type'] ==
                                                                'imagesAr'
                                                            ? ImagesSingle(
                                                                content:
                                                                    content[
                                                                        index])
                                                            : content[index][
                                                                        'type'] ==
                                                                    'imagesMulti'
                                                                ? ImagesMulti(
                                                                    content:
                                                                        content[
                                                                            index])
                                                                : content[index]['type'] ==
                                                                        'table'
                                                                    ? TableImage(
                                                                        content:
                                                                            content[
                                                                                index])
                                                                    : content[index]['type'] ==
                                                                            'subTitle2'
                                                                        ? SubTitle2(
                                                                            label: content[index]['detail'])
                                                                        : SubTitle(
                                                                            label:
                                                                                content[index]['detail'],
                                                                          );
                        // return Text(content[0].toString(),
                        //     textAlign: TextAlign.justify,
                        //     style: TextStyle(height: 1.8));
                      }),
                  Spacing3
                ],
              ),
            ),
          ),
          BottomNavigationCustom2()
        ],
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
    return 'Gambar ${name.split('_')[2].split('.')[0]}. ';
  }

  @override
  Widget build(BuildContext context) {
    print(widget.content);
    return Container(
      child: widget.content['isAr'].toString().isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                ),
                widget.content['isAr'] != null
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArViewPage(
                                        code: widget.content['isAr'],
                                      )));
                        },
                        child: Image.asset(
                            'assets/images/materi/${widget.content['name']}'),
                      )
                    : widget.content['detail'] == null
                        ? InstaImageViewer(
                            child: Image.asset(
                                'assets/images/materi/${widget.content['name']}'))
                        : itemImages4(
                            name: widget.content['name'],
                            label: widget.content['label'],
                            sumber: widget.content['Sumber'],
                            imageLabel: 'kosong',
                            title: 'kosong',
                            detail: widget.content['detail']),
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
                            formatName(widget.content['name']),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ),
                          Flexible(
                            child: Text(
                              '${widget.content['label']}',
                              style: TextStyle(fontSize: 9),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: RichTextCustomLabel(
                                content:
                                    'Sumber : ${widget.content['Sumber']}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          : Column(
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
                            formatName(widget.content['name']),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
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
                widget.content['isAr'].toString().isNotEmpty
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArViewPage(
                                        code: widget.content['isAr'],
                                      )));
                        },
                        child: Image.asset(
                            'assets/images/materi/${widget.content['name']}'),
                      )
                    : InstaImageViewer(
                        child: Image.asset(
                            'assets/images/materi/${widget.content['name']}'))
              ],
            ),
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
    return 'Gambar ${name.split('_')[2].split('.')[0]} .';
  }

  formatNameTable(String name) {
    return 'Tabel ${name.split('_')[2].split('.')[0]} .';
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.content['isAr'].toString()} isAr');
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: widget.content['Sumber2'] == '-'
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.content['isAr'] != null
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: itemImages2(
                    name: widget.content['name1'],
                    label: widget.content['label1'],
                    sumber: widget.content['Sumber1'],
                    imageLabel: formatName(widget.content['name1']),
                    code: widget.content['isAr'],
                  ),
                )
              : widget.content['detail1'] == null
                  ? itemImages(
                      name: widget.content['name1'],
                      label: widget.content['label1'],
                      sumber: widget.content['Sumber1'],
                      imageLabel: formatName(widget.content['name1']),
                    )
                  : itemImages4(
                      name: widget.content['name1'],
                      detail: widget.content['detail1'],
                      label: widget.content['label1'],
                      sumber: widget.content['Sumber1'],
                      title: 'a. ${widget.content['title1']}',
                      imageLabel: formatName(widget.content['name1']),
                    ),
          widget.content['label2'] != '-'
              ? widget.content['detail2'] == null
                  ? itemImages(
                      name: widget.content['name2'],
                      label: widget.content['label2'],
                      sumber: widget.content['Sumber2'],
                      imageLabel: widget.content['Sumber2'] != '-'
                          ? formatName(widget.content['name2'])
                          : formatNameTable(widget.content['name2']))
                  : itemImages4(
                      name: widget.content['name2'],
                      detail: widget.content['detail2'],
                      label: widget.content['label2'],
                      sumber: widget.content['Sumber2'],
                      title: 'b. ${widget.content['title2']}',
                      imageLabel: formatName(widget.content['name2']),
                    )
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // RichTextCustomLabel(
                  //   content: formatName(widget.content['name']),
                  // ),
                  Flexible(
                    child: RichTextCustomLabel(
                      content:
                          '${formatName(widget.content['name'])} ${widget.content['label']}',
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
        widget.content['detail'] == null
            ? InstaImageViewer(
                child: Image.asset(
                    'assets/images/materi/${widget.content['name']}'))
            : InkWell(
                onTap: () {
                  print(widget.content['detail'] is List);
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          InstaImageViewer(
                              child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/materi/${widget.content['name']}',
                                  width: 150,
                                )),
                          )),
                          Container(
                            height: 400,
                            padding: EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  widget.content['detail'] is List
                                      ? ListView.builder(
                                          itemCount:
                                              widget.content['detail'].length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            print(widget.content);
                                            return widget.content['detail']
                                                        [index]['type'] ==
                                                    'text'
                                                ? Container(
                                                    child: RichTextCustom(
                                                        content: widget
                                                            .content['detail']
                                                                [index]
                                                                ['detail']
                                                            .toString()),
                                                  )
                                                : widget.content['detail']
                                                            [index]['type'] ==
                                                        'bullet'
                                                    ? BulletItem2(
                                                        text: widget
                                                            .content['detail']
                                                                [index]
                                                                ['detail']
                                                            .toString())
                                                    : Container();
                                          },
                                        )
                                      : RichTextCustom(
                                          content:
                                              "${widget.content['detail']}")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/materi/${widget.content['name']}',
                      )),
                ),
              ),
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
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            imageLabel + ' ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ),
                        ),
                        RichTextCustomLabel(content: label)
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
        InstaImageViewer(
            child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/materi/$name',
                width: 150,
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
                            '$imageLabel ',
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

class itemImages4 extends StatelessWidget {
  const itemImages4({
    super.key,
    required this.name,
    required this.label,
    required this.sumber,
    required this.imageLabel,
    required this.detail,
    required this.title,
  });
  final String imageLabel;
  final String name;
  final String label;
  final String sumber;
  final String detail;
  final String title;

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
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            imageLabel + ' ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ),
                        ),
                        RichTextCustomLabel(content: label)
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
        title == 'kosong'
            ? Text(title)
            : Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 237, 228, 150)),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Positioned(
                      top: 0,
                      child: InstaImageViewer(
                          child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/materi/$name',
                              width: 250,
                            )),
                      )),
                    ),
                    Container(
                      height: 450,
                      padding: EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [RichTextCustom(content: detail)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/materi/$name',
                  width: imageLabel == 'kosong' ? 250 : 150,
                )),
          ),
        ),
        sumber != '-'
            ? imageLabel != 'kosong'
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
                                '$imageLabel ',
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
            : Container()
      ],
    );
  }
}

class itemImages2 extends StatelessWidget {
  const itemImages2({
    super.key,
    required this.name,
    required this.label,
    required this.sumber,
    required this.imageLabel,
    required this.code,
  });
  final String imageLabel;
  final String name;
  final String label;
  final String sumber;
  final String code;

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
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArViewPage(
                          code: code,
                        )));
          },
          child: Image.asset(
            'assets/images/materi/$name',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
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
                            '$imageLabel ',
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
            padding: EdgeInsets.only(right: 5.0, top: 10),
            child: Icon(
              Icons.circle,
              size: 10.0,
              color: Colors.black,
            ),
          ),
          Flexible(
              child: RichTextCustom(
            content: text,
          )),
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
