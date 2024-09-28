import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/network/dio_helper.dart';
import 'package:soil_flutter/models/workspace_model.dart';
import 'workspace_event.dart';
import 'workspace_state.dart';

class WorkspaceBloc extends Bloc<WorkspaceEvent, WorkspaceState> {
  WorkspaceBloc() : super(WorkspaceInitial()) {
    on<LoadWorkspaces>(_onLoadWorkspaces);
    on<ReserveWorkspace>(_onReserveWorkspace);
  }

  Future<void> _onLoadWorkspaces(
      LoadWorkspaces event,
      Emitter<WorkspaceState> emit,
      ) async {
    emit(WorkspaceLoading());
    try {
      // Use DioHelper to get data from the API
      final response = await DioHelper.getData(url: 'workspaces');

      if (response.statusCode == 200) {
        // Parse the response data
        final List<Workspace> workspaces = (response.data as List)
            .map((workspaceJson) => Workspace.fromJson(workspaceJson))
            .toList();

        emit(WorkspaceLoaded(workspaces));
      } else {
        emit(WorkspaceError('Failed to load workspaces: ${response.statusMessage}'));
      }
    } catch (error) {
      emit(WorkspaceError('Failed to load workspaces: $error'));
    }
  }

  Future<void> _onReserveWorkspace(
      ReserveWorkspace event,
      Emitter<WorkspaceState> emit,
      ) async {
    emit(WorkspaceReservationLoading());
    try {
      // Use DioHelper to send reservation request to the API
      final response = await DioHelper.postData(
        url: 'workspace/reserve',
        data: {
          'workspaceId': event.workspaceId,
          'dateTimeFrom': event.dateTimeFrom.toIso8601String(),
          'dateTimeTo': event.dateTimeTo.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        emit(WorkspaceReserved('Workspace reserved successfully!'));
      } else {
        emit(WorkspaceReservationError('Failed to reserve workspace: ${response.statusMessage}'));
      }
    } catch (error) {
      emit(WorkspaceReservationError('Failed to reserve workspace: $error'));
    }
  }
}
