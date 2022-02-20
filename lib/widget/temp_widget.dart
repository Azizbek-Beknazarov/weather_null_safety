import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ob_havo_null/model/weather_model.dart';

class TempWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

   TempWidget({Key? key,required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list=snapshot.data?.list;
    var temp=list?[0].temp.day.toStringAsFixed(0);
    var main=list?[0].weather[0].main;
    return Container(child: Column(children: [
      Text("$temp °C",style: TextStyle(fontSize: 33),),
      SizedBox(),
      Text('$main'),

    ],),);
  }
}
