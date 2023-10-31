import 'dart:convert';
import 'dart:html';

import 'package:demo/models/weather_model.dart';
import 'package:geocoding/geocoding.dart';

class WeatherService{
  static const BASE_URL ='http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;



  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName)async{
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
  

    if(response.statusCode==200){
      return Weather.fromJson(jsonDecode(response.body));

    }else{
      throw Exception("False to load weathr data");
    } 
  }
  Future<String> getCurrentCity() async{
    LocationPermisson permisson = await Geolocator.checkPermisson();
    if(permisson == LocationPermisson.denied){
      permisson = await Geolocation.requestPermisson();

    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> place
  }

}