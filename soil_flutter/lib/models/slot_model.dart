import 'package:soil_flutter/models/workspace_model.dart';

class Slot {
  int id;
  Workspace workspace;
  DateTime startTime;
  DateTime endTime;
  bool reserved;

  Slot({
    required this.id,
    required this.workspace,
    required this.startTime,
    required this.endTime,
    required this.reserved,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['id'],
      workspace: Workspace.fromJson(json['workspace']),
      startTime: DateTime.parse(json['dateTimeFrom']),
      endTime: DateTime.parse(json['dateTimeTo']),
      reserved: json['reserved'],
    );
  }
}
