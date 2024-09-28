abstract class SlotEvent {}

class LoadSlots extends SlotEvent {
  final int workspaceId;

  LoadSlots(this.workspaceId);
}