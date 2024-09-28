import 'package:soil_flutter/models/workspace_model.dart';

abstract class WorkspaceState {}

class WorkspaceInitial extends WorkspaceState {}

class WorkspaceLoading extends WorkspaceState {}

class WorkspaceLoaded extends WorkspaceState {
  final List<Workspace> workspaces;

  WorkspaceLoaded(this.workspaces);
}

class WorkspaceError extends WorkspaceState {
  final String message;

  WorkspaceError(this.message);
}

class WorkspaceReservationLoading extends WorkspaceState {}

class WorkspaceReserved extends WorkspaceState {
  final String successMessage;

  WorkspaceReserved(this.successMessage);
}

class WorkspaceReservationError extends WorkspaceState {
  final String message;

  WorkspaceReservationError(this.message);
}