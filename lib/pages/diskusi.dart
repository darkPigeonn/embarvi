import 'package:flutter/material.dart';

class DiskusiPage extends StatefulWidget {
  const DiskusiPage({super.key});

  @override
  State<DiskusiPage> createState() => _DiskusiPageState();
}

class _DiskusiPageState extends State<DiskusiPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Gagal memuat Data'),
      ),
    );
  }
}
