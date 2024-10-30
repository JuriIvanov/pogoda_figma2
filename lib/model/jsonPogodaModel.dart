import 'dart:convert';

class JsonPogodaModel {
  JsonPogodaModel({
    this.location,
    this.current,
    this.forecast,
  });

  JsonPogodaModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }

  Location? location;
  Current? current;
  Forecast? forecast;
}

class Forecast {
  Forecast({
    this.forecastday,
  });

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = [];
      json['forecastday'].forEach((v) {
        forecastday?.add(Forecastday.fromJson(v));
      });
    }
  }

  List<Forecastday>? forecastday;
}

class Forecastday {
  Forecastday({
    this.date,
    this.day,
  });

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
  }

  String? date;
  Day? day;
}

class Day {
  Day({
    this.maxtempC,
    this.mintempC,
    this.avgtempC,
    this.condition,
  });

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtempC = json['avgtemp_c'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }

  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  Condition? condition;
}

class Condition {
  Condition({
    this.text,
    this.icon,
  });

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
  }

  String? text;
  String? icon;
}

class Current {
  Current({
    this.tempC,
    this.isDay,
    this.condition,
  });

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }

  double? tempC;
  int? isDay;
  Condition? condition;
}

class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;
}
