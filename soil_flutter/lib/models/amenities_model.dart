class Amenities {
  bool wifi;
  bool projector;
  int capacity;

  Amenities({
    required this.wifi,
    required this.projector,
    required this.capacity,
  });

  factory Amenities.fromJson(Map<String, dynamic> json) {
    return Amenities(
      wifi: json['wifi'],
      projector: json['projector'],
      capacity: json['capacity'],
    );
  }
}