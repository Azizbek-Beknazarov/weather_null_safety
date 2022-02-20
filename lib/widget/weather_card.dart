import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ob_havo_null/model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  final int index;
  const WeatherCard(this.snapshot,this.index) ;

  @override
  Widget build(BuildContext context) {
    final list=snapshot.data?.list;
    var dayOfWeek='';
    DateTime time=DateTime.fromMillisecondsSinceEpoch(list![index].dt*1000);
    dayOfWeek=DateFormat('MMMM d').format(time);
    var tempMin=list[index].temp.min;
    var icon=list[index].getIconUrl();
    return Container(
      margin: EdgeInsets.only(left: 2),
      padding: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.yellow,width: 3,)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dayOfWeek),
          Row(
            children: [
              Text('$tempMin'),
              Image.network(icon),
            ],
          ),
        ],
      ),
    );
  }
}
