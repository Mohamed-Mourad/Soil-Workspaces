class Amenities {
  bool wifi;
  bool projector;

  Amenities({
    required this.wifi,
    required this.projector,
  });

  factory Amenities.fromJson(Map<String, dynamic> json) {
    return Amenities(
      wifi: json['wifi'],
      projector: json['projector'],
    );
  }
}