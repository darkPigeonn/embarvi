import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final VoidCallback onPressed;
  const Menu({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width * 0.15;
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: widthSize,
          height: widthSize,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text('')),
    );
  }
}
