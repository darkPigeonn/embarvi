import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
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
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(10),
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
                  child: Image.asset(
                    'assets/images/icons/' + icon,
                  )),
              Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 1),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}

class Menu3 extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String label;
  const Menu3({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width * 0.9;
    return InkWell(
      onTap: onPressed,
      child: Container(
          margin: EdgeInsets.only(
            bottom: 5,
            right: 10,
          ),
          child: Column(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(10),
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
                  child: Image.asset(
                    'assets/images/icons/' + icon,
                  )),
              Container(
                width: 70,
                margin: EdgeInsets.only(
                  top: 5,
                  left: 1,
                ),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}

class Menu2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String label;
  const Menu2({
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
          child: Column(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons/' + icon,
                      ),
                    ],
                  )),
              Container(
                width: 60,
                margin: EdgeInsets.only(top: 5, left: 1, bottom: 5),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
