import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_havo_null/api/weather_api.dart';
import 'package:ob_havo_null/model/weather_model.dart';
import 'package:ob_havo_null/page/city_page.dart';
import 'package:ob_havo_null/widget/bottom_list.dart';
import 'package:ob_havo_null/widget/city_widget.dart';
import 'package:ob_havo_null/widget/deatail_widget.dart';
import 'package:ob_havo_null/widget/temp_widget.dart';

class HomePage extends StatefulWidget {
  final locationData;

  HomePage({this.locationData});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherModel> object;
  late String city;

  @override
  void initState() {
    super.initState();
    if (widget.locationData != null) {
      object = Future.value(widget.locationData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title: Text('Ob-havo uz',style: TextStyle(color: Colors.amber),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.location_on_outlined),
          color: Colors.red,
          onPressed: () {
            setState(() {
              object = WeatherApi().fetchWeather();
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tapped = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return CityPage();
                  }));
              if (tapped != null) {
                setState(() {
                  city = tapped;
                  object = WeatherApi().fetchWeather(city: city, iscity: true);
                });
              }
            },
            icon: Icon(
              Icons.location_city,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView(

        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/weather1.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            child: FutureBuilder<WeatherModel>(
              future: object,
              builder: (context, snapshot) {
                var icon=snapshot.data?.list![0].getIconUrl();
                log('icon url: ${icon.toString()}');
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CityWidget(snapshot: snapshot),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TempWidget(snapshot: snapshot,),
                      ],),
                      Image.network(icon!, scale: 0.4, ),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      DetailWidget(snapshot: snapshot,),
                      SizedBox(
                        height: 30,
                      ),
                      Bottomlist(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      'Shahar topilmadi',
                      style:
                      TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
