import 'location.dart';
import 'networking.dart';

String url = 'https://api.openweathermap.org/data/2.5/weather';
String appKey = 'appKey';

class WeatherModel {
  Future<dynamic> getCityWeather(name) async {
    Http http = Http('$url?q=$name&appid=$appKey&units=metric');
    var data = await http.get();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    double lat = location.latitude;
    double lon = location.longitude;
    Http http = Http('$url?lat=$lat&lon=$lon&appid=$appKey&units=metric');
    var data = await http.get();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
