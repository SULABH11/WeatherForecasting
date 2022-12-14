import 'location.dart';
import 'networking.dart';

const apikey = '3eff8652921769f8dd489006d5ece4c1';

class WeatherModel {
  Future<dynamic> getcityweather (String cityname) async
  {
    var url='https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
    network ob=network(url);
    var weatherdata=await ob.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    Location obj = Location();
    await obj.getlocation();
    network ob = network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${obj.latitude}&lon=${obj.longitude}&appid=$apikey&units=metric');
    var weatherdata = await ob.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
