import 'package:soil_flutter/models/amenities_model.dart';

class Workspace {
  String name;
  String image;
  String location;
  Amenities amenities;

  Workspace({
    required this.name,
    required this.image,
    required this.location,
    required this.amenities,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      name: json['name'],
      image: json['image'],
      location: json['location'],
      amenities: Amenities.fromJson(json['amenities']),
    );
  }
}
