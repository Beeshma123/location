import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
part 'weather_state.dart';

class Events {
  double lat,long;
  Events(double lat,double long)
  {
    this.lat=lat;
    this.long=long;
  }
}
class WeatherBloc extends Bloc<Events, WeatherState>{
  WeatherBloc() : super(WeatherState(0.0, 0.0));

  @override
  Stream<WeatherState> mapEventToState(Events event) async*{
    // TODO: implement mapEventToState

    if(event is Events)
      {
        yield WeatherState(event.lat, event.long);
      }

  }
}