import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ob_havo_null/model/weather_model.dart';

class CityWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

   CityWidget({required this.snapshot}) ;

  @override
  Widget build(BuildContext context) {
    // var list=snapshot.data?.list;
    var city=snapshot.data?.city.name;
    var country=snapshot.data?.city.country;
    // var formattedDate=DateTime.fromMillisecondsSinceEpoch(list![0].dt*1000);
    return Container(child: Column(
      children: [
        Text(
          '$city, $country',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.white,
          ),
        ),
        Text(
          '${DateFormat('d, MMMM, y, hh:mm:ss').format(DateTime.now()) } ',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white38
          ),
        ),
      ],
    ),);
  }
}
