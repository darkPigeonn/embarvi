import 'package:embarvi/Components/content.dart';
import 'package:embarvi/Components/spacing/spacing.dart';
import 'package:embarvi/pages/layout.dart';
import 'package:embarvi/pages/materi.dart';
import 'package:embarvi/utils/colorLib.dart';
import 'package:embarvi/utils/dataText.dart';
import 'package:embarvi/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String nama = '';
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      nama = sharedPreferences.get('name').toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final finalScore = (widget.score / questions.length) * 100;
    return Scaffold(
      backgroundColor: primaryC,
      body: SingleChildScrollView(
        child: Container(
          margin: marginPrimary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacing2,
              TitlePage(
                title: 'FORMATIF',
              ),
              Spacing3,
              Text(
                'Nilai Kamu: $nama',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacing3,
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        value: widget.score / 15,
                        color: Colors.green,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        finalScore.round().toString(),
                        style: const TextStyle(fontSize: 80),
                      ),
                    ],
                  ),
                ],
              ),
              Spacing2,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Benar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacing3,
                        Text(
                          widget.score.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Salah',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacing3,
                        Text(
                          (questions.length - widget.score).toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacing3,
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LayoutPage()));
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
                    'assets/images/icons/11.png',
                    width: 30, // Sesuaikan ukuran gambar jika perlu
                    height: 30, // Sesuaikan ukuran gambar jika perlu
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
