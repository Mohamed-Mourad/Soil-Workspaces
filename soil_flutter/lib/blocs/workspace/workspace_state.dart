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
