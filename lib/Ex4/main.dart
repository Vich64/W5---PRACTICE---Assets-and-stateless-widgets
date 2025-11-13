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
        body: const SafeArea(child: WeatherHome()),
      ),
    );
  }
}

enum Weather {
  phnomPenh(
    city: 'Phnom Penh',
    minTemp: 18.0,
    maxTemp: 32.0,
    currentTemp: 12.2,
    iconPath: 'assets/Ex4/cloudy.png',
    gradientColors: [Color(0xFF7B4397), Color(0xFFDC2430)],
  ),
  paris(
    city: 'Paris',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 22.2,
    iconPath: 'assets/Ex4/sunny.png',
    gradientColors: [Color(0xFF74EBD5), Color(0xFFACB6E5)],
  ),
  rome(
    city: 'Rome',
    minTemp: 18.0,
    maxTemp: 45.0,
    currentTemp: 45.2,
    iconPath: 'assets/Ex4/sunnyCloudy.png',
    gradientColors: [Color(0xFFFF4E50), Color(0xFFF9D423)],
  ),
  toulouse(
    city: 'Toulouse',
    minTemp: 10.0,
    maxTemp: 42.0,
    currentTemp: 45.2,
    iconPath: 'assets/Ex4/veryCloudy.png',
    gradientColors: [Color(0xFFFFB75E), Color(0xFFED8F03)],
  );

  const Weather({
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.iconPath,
    required this.gradientColors,
  });

  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String iconPath;
  final List<Color> gradientColors;
}

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          NavBar(),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'City Forecast',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          WeatherCard(weather: Weather.phnomPenh),
          SizedBox(height: 20),
          WeatherCard(weather: Weather.paris),
          SizedBox(height: 20),
          WeatherCard(weather: Weather.rome),
          SizedBox(height: 20),
          WeatherCard(weather: Weather.toulouse),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({required this.weather, super.key});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 6,
        borderRadius: BorderRadius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: weather.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -100,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          weather.gradientColors[1].withOpacity(0.6),
                          weather.gradientColors[0].withOpacity(0.4),
                          weather.gradientColors[1].withOpacity(0.2),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.4, 0.7, 1.0],
                        center: Alignment.center,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(weather.iconPath),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weather.city,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Min ${weather.minTemp}°C',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                'Max ${weather.maxTemp}°C',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '${weather.currentTemp}°C',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blue,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Icon(Icons.menu, color: Colors.white),
    );
  }
}
