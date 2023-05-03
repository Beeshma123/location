
import 'package:flutter/material.dart';

import 'WeatherModel.dart';


class LocationScreen extends StatefulWidget {
  var locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  var temperature;
  var conditionId;
  var cityName;
  var weatherIcon;
  var weatherMessage;
  var location;

  void initState() {
    print("See here --> ${widget.locationWeather}");
    changeUI(widget.locationWeather);
  }

  void changeUI(dynamic weatherInfo) async {
    setState(() {
      temperature = weatherInfo['main']['temp'].toInt();
      conditionId = weatherInfo['weather'][0]['id'];
      cityName = weatherInfo['name'];

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 0,
              ),
              Column(
                children: [
                  Text(
                    'Location :',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white70
                    ),

                  ),
                  Text(
                    '${cityName}',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w100,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 130.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature}°',

                    ),
                    Text(
                      "${weatherIcon}",

                    ),
                  ],
                ),
              ),
              SizedBox(height: 100,),
              Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 50),
                child: Text(
                  "${weatherMessage}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 30
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
