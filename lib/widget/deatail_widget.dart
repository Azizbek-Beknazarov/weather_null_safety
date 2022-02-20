import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ob_havo_null/model/weather_model.dart';
import 'package:ob_havo_null/util/util.dart';

class DetailWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  DetailWidget({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final list=snapshot.data?.list;
    var pressure=list![0].pressure;
    var humidity=list[0].humidity;
    var wind=list[0].speed;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Util.getWidget(FontAwesomeIcons.thermometerThreeQuarters, pressure.round(), 'mm Hg'),
          Util.getWidget(FontAwesomeIcons.cloudRain, humidity, '%'),
          Util.getWidget(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
        ],
      ),
    );
  }
}
