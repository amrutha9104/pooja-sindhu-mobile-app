import 'package:flutter/material.dart';
import 'package:pooja_sindhu/features/booking/presentation/widgets/slot_picker.dart';
class DateTimeSelectionStep extends StatelessWidget { const DateTimeSelectionStep({super.key, required this.panditId, required this.onSlotSelected}); final String panditId; final ValueChanged<DateTime> onSlotSelected; @override Widget build(BuildContext context) => SlotPicker(panditId: panditId, onSlotSelected: onSlotSelected); }
