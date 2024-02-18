import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  const Menu({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width * 0.15;
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: widthSize,
          height: 80,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Icon(
                icon,
                size: 35,
                color: Colors.white,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 9),
              )
            ],
          )),
    );
  }
}
