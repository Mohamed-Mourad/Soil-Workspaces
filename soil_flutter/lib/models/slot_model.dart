import 'package:soil_flutter/models/workspace_model.dart';

class Slot {
  int id;
  Workspace workspace;
  DateTime dateTimeFrom;
  DateTime dateTimeTo;
  bool reserved;

  Slot({
    required this.id,
    required this.workspace,
    required this.dateTimeFrom,
    required this.dateTimeTo,
    required this.reserved,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['id'],
      workspace: json['workspace'],
      dateTimeFrom: json['from'],
      dateTimeTo: json['to'],
      reserved: json['reserved'],
    );
  }
}
