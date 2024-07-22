import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Model/weather_model.dart';
import '../Services/weather_services.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _weather;
  bool _isLoading = false;

  void _fetchWeather([String? cityName]) async {
    setState(() {
      _isLoading = true;
    });

    try {
      String cityToFetch = cityName ?? await _weatherService.getCurrentCity();
      final weather = await _weatherService.fetchWeather(cityToFetch);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'animations/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case "clouds":
        return 'animations/cloud.json';
      case "fog":
        return 'animations/cloud.json';
      case "shower rain":
        return 'animations/rain.json';
      case "thunderstorm":
      case "clear":
        return 'animations/sunny.json';
      default:
        return 'animations/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _fetchWeather(_controller.text),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              Center(child: CircularProgressIndicator())
            else if (_weather == null)
              Center(child: Text('No weather data'))
            else
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_weather?.cityName ?? "Loading City.."),
                      Lottie.asset(
                          getWeatherAnimation(_weather?.mainCondition)),
                      Text("${_weather?.temperature.round()} °C"),
                      Text(_weather?.mainCondition ?? ""),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
