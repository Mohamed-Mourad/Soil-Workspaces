abstract class WorkspaceEvent {}

class LoadWorkspaces extends WorkspaceEvent {}

class ReserveWorkspace extends WorkspaceEvent {
  final int workspaceId;
  final DateTime dateTimeFrom;
  final DateTime dateTimeTo;

  ReserveWorkspace({
    required this.workspaceId,
    required this.dateTimeFrom,
    required this.dateTimeTo,
  });
}