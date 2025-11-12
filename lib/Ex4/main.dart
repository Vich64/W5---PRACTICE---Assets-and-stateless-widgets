import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF7FB6F7),
        body: const SafeArea(child: WeatherList()),
      ),
    );
  }
}

class WeatherList extends StatelessWidget {
  const WeatherList({super.key});

  static const List<CityWeather> _cities = [
    CityWeather(
      name: 'Phnom Penh',
      minTemp: 18,
      maxTemp: 32,
      currentTemp: 12.2,
      iconAsset: 'assets/Ex4/cloudy.png',
      gradient: [Color(0xFF7B4397), Color(0xFFDC2430)],
    ),
    CityWeather(
      name: 'Paris',
      minTemp: 10,
      maxTemp: 40,
      currentTemp: 22.2,
      iconAsset: 'assets/Ex4/sunny.png',
      gradient: [Color(0xFF74EBD5), Color(0xFFACB6E5)],
    ),
    CityWeather(
      name: 'Rome',
      minTemp: 18,
      maxTemp: 45,
      currentTemp: 45.2,
      iconAsset: 'assets/Ex4/sunnyCloudy.png',
      gradient: [Color(0xFFFF4E50), Color(0xFFF9D423)],
    ),
    CityWeather(
      name: 'Toulouse',
      minTemp: 10,
      maxTemp: 42,
      currentTemp: 45.2,
      iconAsset: 'assets/Ex4/veryCloudy.png',
      gradient: [Color(0xFFFFB75E), Color(0xFFED8F03)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'City Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.menu, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: _cities.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 20), //Ai generated
              itemBuilder: (context, index) {
                final city = _cities[index];
                return WeatherCard(city: city);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CityWeather {
  const CityWeather({
    required this.name,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.iconAsset,
    required this.gradient,
  });

  final String name;
  final int minTemp;
  final int maxTemp;
  final double currentTemp;
  final String iconAsset;
  final List<Color> gradient;
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({required this.city, super.key});

  final CityWeather city;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black26,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: city.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
              child: Image.asset(
                city.iconAsset,
                width: 36,
                height: 36,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    city.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Min ${city.minTemp}°C • Max ${city.maxTemp}°C',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Text(
              '${city.currentTemp.toStringAsFixed(1)}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
