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
    var tempMax=list[index].temp.max;
     var tempNight=list[index].temp.night;
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
          Center(child: Text(dayOfWeek, style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),)),
          Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Text('min: ${tempMin.round()}°C', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('max: ${tempMax.round()}°C',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('night: ${tempNight.round()}°C',style: TextStyle(fontWeight: FontWeight.bold),),
                    // Image.network(icon),
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Container(child: Image.network(icon)),
            ],
          ),

        ],
      ),
    );
  }
}
