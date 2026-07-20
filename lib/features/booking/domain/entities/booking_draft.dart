class BookingDraft {
  const BookingDraft({
    this.ritualId, this.ritualName, this.panditId, this.panditName,
    this.selectedSlot, this.userAddress, this.notes, this.totalAmount,
  });
  final String? ritualId;
  final String? ritualName;
  final String? panditId;
  final String? panditName;
  final DateTime? selectedSlot;
  final String? userAddress;
  final String? notes;
  final double? totalAmount;
  bool get isReadyToConfirm => ritualId != null && panditId != null && selectedSlot != null;
  BookingDraft copyWith({String? ritualId, String? ritualName, String? panditId, String? panditName, DateTime? selectedSlot, String? userAddress, String? notes, double? totalAmount}) => BookingDraft(
    ritualId: ritualId ?? this.ritualId, ritualName: ritualName ?? this.ritualName,
    panditId: panditId ?? this.panditId, panditName: panditName ?? this.panditName,
    selectedSlot: selectedSlot ?? this.selectedSlot, userAddress: userAddress ?? this.userAddress,
    notes: notes ?? this.notes, totalAmount: totalAmount ?? this.totalAmount,
  );
}
