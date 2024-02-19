import 'package:embarvi/utils/colorLib.dart';
import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  const Button1({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
              color: buttonPrimary,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                width: 140,
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
    );
  }
}

class Button2 extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  const Button2({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
              color: buttonSecondary,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                width: 140,
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
    );
  }
}
