import 'package:embarvi/utils/textStlyLib.dart';
import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'EMBARVI',
          style: title,
        ),
        Column(
          children: [
            Text(
              'E-Module Berbantuan',
            ),
            Text(
              'Augmented Reaality',
            ),
            Text(
              'Materi Virus',
            ),
          ],
        ),
      ],
    );
  }
}
