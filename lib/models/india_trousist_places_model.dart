// To parse this JSON data, do
//
//     final touristModel = touristModelFromJson(jsonString);

import 'dart:convert';

TouristModel touristModelFromJson(String str) =>
    TouristModel.fromJson(json.decode(str));

String touristModelToJson(TouristModel data) => json.encode(data.toJson());

class TouristModel {
  List<TouristPlace> touristPlaces;

  TouristModel({
    required this.touristPlaces,
  });

  factory TouristModel.fromJson(Map<String, dynamic> json) => TouristModel(
        touristPlaces: List<TouristPlace>.from(
            json["tourist_places"].map((x) => TouristPlace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tourist_places":
            List<dynamic>.from(touristPlaces.map((x) => x.toJson())),
      };
}

class TouristPlace {
  String category;
  String categorythumb;
  List<Place> places;

  TouristPlace({
    required this.category,
    required this.categorythumb,
    required this.places,
  });

  factory TouristPlace.fromJson(Map<String, dynamic> json) => TouristPlace(
        category: json["category"],
        categorythumb: json["categorythumb"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "categorythumb": categorythumb,
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class Place {
  String name;
  String image;
  String location;
  String budget;
  String accommodationCost;
  String famous;
  String details;

  Place({
    required this.name,
    required this.image,
    required this.location,
    required this.budget,
    required this.accommodationCost,
    required this.famous,
    required this.details,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["name"],
        image: json["image"],
        location: json["location"],
        budget: json["budget"],
        accommodationCost: json["accommodation_cost"],
        famous: json["famous"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "location": location,
        "budget": budget,
        "accommodation_cost": accommodationCost,
        "famous": famous,
        "details": details,
      };
}
