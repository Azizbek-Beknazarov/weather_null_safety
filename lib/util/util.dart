import 'package:flutter/cupertino.dart';

class Util {
  static getWidget(IconData icon, int value, String info) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$value',
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$info',
        ),
      ],
    );
  }
}
