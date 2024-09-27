import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/models/amenities_model.dart';
import 'package:soil_flutter/models/workspace_model.dart';
import 'workspace_event.dart';
import 'workspace_state.dart';

class WorkspaceBloc extends Bloc<WorkspaceEvent, WorkspaceState> {
  WorkspaceBloc() : super(WorkspaceInitial()) {
    on<LoadWorkspaces>(_onLoadWorkspaces);
  }

  Future<void> _onLoadWorkspaces(
      LoadWorkspaces event,
      Emitter<WorkspaceState> emit,
      ) async {
    emit(WorkspaceLoading());
    try {
      // Mock Data - replace it with your API call if necessary
      final List<Workspace> workspaces = List.generate(10, (index) {
        return Workspace(
          id: index,
          name: 'Workspace $index',
          images: [
            'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg',
            'https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg',
            'https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds',
          ],
          location: 'Location $index',
          capacity: 5 + index,
          amenities: Amenities(
            wifi: index % 2 == 0,
            projector: index % 3 == 0,
          ),
        );
      });
      emit(WorkspaceLoaded(workspaces));
    } catch (error) {
      emit(WorkspaceError('Failed to load workspaces'));
    }
  }
}