import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_havo_null/model/weather_model.dart';
import 'package:ob_havo_null/widget/weather_card.dart';

class Bottomlist extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
 Bottomlist({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final list=snapshot.data?.list;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('7 kunlik ob-havo',
          style: TextStyle(
              color: Colors.black,
              fontSize: 33,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
          ),
        ),
        Container(height: 140,
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                width: MediaQuery.of(context).size.width/2.3,
                height: 160,
                child: WeatherCard(snapshot, index),
              );
            },
            separatorBuilder: (context,index)=>Divider(height: 2,),
            itemCount: list!.length),
        ),

      ],
    );
  }
}
