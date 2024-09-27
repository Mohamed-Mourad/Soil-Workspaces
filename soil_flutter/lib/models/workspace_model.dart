import 'package:soil_flutter/models/amenities_model.dart';

class Workspace {
  int id;
  String name;
  List<String> images;
  String location;
  int capacity;
  Amenities amenities;

  Workspace({
    required this.id,
    required this.name,
    required this.images,
    required this.location,
    required this.capacity,
    required this.amenities,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      location: json['location'],
      capacity: json['capacity'],
      amenities: Amenities.fromJson(json['amenities']),
    );
  }
}
