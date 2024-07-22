import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apikey = "aa6cf2b95c17c1a82b05d8d19f3a0171";
  final String baseUrl = 'http://api.openweathermap.org/data/2.5/weather';
  Future<WeatherModel> fetchWeather(String cityName,
      [String? currentCity]) async {
    final response = await http
        .get(Uri.parse('$baseUrl?q=$cityName&appid=$apikey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    // Get Location from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // Fetch the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Convert the location into list of placemark objects

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // Extract the city name from first placemark
    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
