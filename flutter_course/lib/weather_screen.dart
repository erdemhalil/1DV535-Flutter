import 'package:flutter/material.dart';
import 'package:flutter_course/weather_api.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String location = '';
  String temperature = '';
  String time = '';
  String description = '';
  String iconUrl = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocationWeather();
  }

  Future<void> _getCurrentLocationWeather() async {
  try {
    Map<String, dynamic> weatherData = await WeatherApi().getCurrentWeather();
    var icon = weatherData['weather'][0]['icon'];
    var temp = (weatherData['main']['temp']).round().toString();
    var d12 = DateFormat('dd/MM, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(weatherData['dt'] * 1000)); // 12/31/2000, 10:00 PM


    setState(() {
      location = weatherData['name'];
      temperature = temp;
      time = d12.toString();
      description = weatherData['weather'][0]['description'];
      iconUrl = 'https://openweathermap.org/img/wn/$icon@2x.png';
    });
  } catch (e) {
    // ignore: avoid_print
    print(e);
    // Handle errors here, such as displaying an error message to the user
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Weather')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(iconUrl),
            Text(description),
            const SizedBox(height: 20),
            Text(location, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            Text('$temperature°C', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            const SizedBox(height: 20),
            Text('Time: $time'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}