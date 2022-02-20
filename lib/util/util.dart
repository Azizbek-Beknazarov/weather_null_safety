import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util {
  static getWidget(IconData icon, int value, String info) {
    return Column(
      children: [
        Icon(

          icon,
          size: 30,
          color: Colors.red.shade300,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$value'
          ,
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$info',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
