import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location{
  double? lon;
  double? lat;
 Future<void> getCurrentLocation()async{
    try{
      Position position =await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    lat=position.latitude;
    lon=position.longitude;
    }
    catch(e){
      log('Location classdagi xato: $e');
    }
  }
}