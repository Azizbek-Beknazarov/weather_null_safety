import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ob_havo_null/api/weather_api.dart';
import 'package:ob_havo_null/page/home_page.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  //
  void getLocationData()async{
    try{
      var locationdata=await WeatherApi().fetchWeather();
      Navigator.push(context,
      MaterialPageRoute(builder: (context){
        return HomePage(locationData: locationdata,);
      }));
    }catch(e){
      log("getlocationdata dagi xato:$e");
    }
  }

  //
  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 200,
        ),
      ),
    );
  }
}
