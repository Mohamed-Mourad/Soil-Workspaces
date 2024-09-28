import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/models/slot_model.dart';
import 'package:soil_flutter/network/dio_helper.dart';
import 'slot_event.dart';
import 'slot_state.dart';

class SlotBloc extends Bloc<SlotEvent, SlotState> {
  SlotBloc() : super(SlotInitial()) {
    on<LoadSlots>(_onLoadSlots);
  }

  Future<void> _onLoadSlots(
      LoadSlots event,
      Emitter<SlotState> emit,
      ) async {
    emit(SlotLoading());
    try {
      // Use DioHelper to get data from the API
      final response = await DioHelper.getData(
        url: 'slots',
        query: {'workspaceId': event.workspaceId},
      );

      if (response.statusCode == 200) {
        // Ensure response.data is a List of maps
        final List<dynamic> data = response.data;

        // Parse the response data into a list of Slot objects
        final List<Slot> slots = data.map((slotJson) {
          return Slot.fromJson(slotJson as Map<String, dynamic>);
        }).toList();

        emit(SlotLoaded(slots));
      } else {
        emit(SlotError('Failed to load slots: ${response.statusMessage}'));
      }
    } catch (error) {
      emit(SlotError('Failed to load slots: $error'));
    }
  }
}
