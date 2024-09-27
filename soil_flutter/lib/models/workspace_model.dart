import 'package:soil_flutter/models/amenities_model.dart';

class Workspace {
  int id;
  String name;
  List<String> images;
  String location;
  Amenities amenities;

  Workspace({
    required this.id,
    required this.name,
    required this.images,
    required this.location,
    required this.amenities,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      location: json['location'],
      amenities: Amenities.fromJson(json['amenities']),
    );
  }
}
