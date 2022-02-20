import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ob_havo_null/model/weather_model.dart';
import 'package:ob_havo_null/util/constants.dart';
import 'package:ob_havo_null/util/location.dart';

class WeatherApi {
  Future<WeatherModel> fetchWeather({String? city, bool? iscity}) async {
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> parameters;

    if (iscity == true) {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': city,
      };
      parameters = params;
    } else {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lon': location.lon.toString(),
        'lat': location.lat.toString(),
      };
      parameters = params;
    }

    var url=Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH,parameters);
    log("request: ${url.toString()}");

    var response=await http.get(url);
    log("response: ${response.body}");

    //Map<String, dynamic>
    if(response.statusCode==200){
    return WeatherModel.fromJson(json.decode(response.body));
  }else{
      return Future.error("responsedagi xato: ${response.statusCode}");
    }}
}
