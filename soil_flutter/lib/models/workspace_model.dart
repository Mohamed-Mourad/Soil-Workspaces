import 'package:soil_flutter/models/amenities_model.dart';

class Workspace {
  String name;
  List<String> images;
  String location;
  Amenities amenities;

  Workspace({
    required this.name,
    required this.images,
    required this.location,
    required this.amenities,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      name: json['name'],
      images: List<String>.from(json['images']),
      location: json['location'],
      amenities: Amenities.fromJson(json['amenities']),
    );
  }
}
