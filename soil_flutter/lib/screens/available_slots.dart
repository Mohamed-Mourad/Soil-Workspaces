import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/slot/slot_bloc.dart';
import 'package:soil_flutter/blocs/slot/slot_state.dart';
import 'package:soil_flutter/blocs/slot/slot_event.dart';
import 'package:soil_flutter/models/slot_model.dart';

class AvailableSlots extends StatefulWidget {
  final int workspaceId;

  const AvailableSlots({
    super.key,
    required this.workspaceId,
  });

  @override
  _AvailableSlotsState createState() => _AvailableSlotsState();
}

class _AvailableSlotsState extends State<AvailableSlots> {
  late SlotBloc _slotBloc;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _slotBloc = BlocProvider.of<SlotBloc>(context);
    _slotBloc.add(LoadSlots(widget.workspaceId)); // Load slots for this workspace
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workspace Slots'),
      ),
      body: BlocBuilder<SlotBloc, SlotState>(
        builder: (context, state) {
          if (state is SlotLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SlotLoaded) {
            // Group slots by date
            Map<DateTime, List<Slot>> groupedSlots = _groupSlotsByDate(state.slots);

            return Column(
              children: [
                _buildCalendar(groupedSlots),
                _buildSlotList(groupedSlots[_selectedDayOnly] ?? []),
              ],
            );
          } else if (state is SlotError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildCalendar(Map<DateTime, List<Slot>> groupedSlots) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      eventLoader: (day) => groupedSlots[DateTime(day.year, day.month, day.day)] ?? [], // Use date only
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay; // Update the focused day as well
        });
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          if (events.isNotEmpty) {
            // If there are slots on this day, show a marker
            return _buildEventMarker(events as List<Slot>);
          }
          return null;
        },
      ),
    );
  }

  // Get only the date part of the selected day to match the grouping key
  DateTime get _selectedDayOnly => DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);

  Widget _buildEventMarker(List<Slot> slots) {
    int availableSlots = slots.where((slot) => slot.reserved).length;
    int bookedSlots = slots.where((slot) => !slot.reserved).length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (availableSlots > 0)
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          ),
        if (bookedSlots > 0)
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          ),
      ],
    );
  }

  Widget _buildSlotList(List<Slot> slots) {
    if (slots.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No slots available on this day'),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: slots.length,
        itemBuilder: (context, index) {
          final slot = slots[index];
          return ListTile(
            title: Text('${slot.startTime.hour} - ${slot.endTime.hour}'),
            subtitle: Text(slot.reserved ? 'Available' : 'Booked'),
            tileColor: slot.reserved ? Colors.green[100] : Colors.red[100],
          );
        },
      ),
    );
  }

  Map<DateTime, List<Slot>> _groupSlotsByDate(List<Slot> slots) {
    Map<DateTime, List<Slot>> groupedSlots = {};
    for (var slot in slots) {
      // Only use the date part of the DateTime (ignoring time)
      DateTime date = DateTime(slot.startTime.year, slot.startTime.month, slot.startTime.day);
      if (!groupedSlots.containsKey(date)) {
        groupedSlots[date] = [];
      }
      groupedSlots[date]!.add(slot);
    }
    return groupedSlots;
  }
}
