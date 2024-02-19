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
    final widthSize = MediaQuery.of(context).size.width * 0.0;
    return InkWell(
      onTap: onPressed,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 4),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.green,
                ),
              ),
              Container(
                width: 80,
                margin: EdgeInsets.only(top: 5, left: 1),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
