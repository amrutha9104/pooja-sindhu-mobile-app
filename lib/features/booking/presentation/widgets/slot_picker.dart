import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pooja_sindhu/core/theme/app_spacing.dart';
import 'package:pooja_sindhu/features/booking/domain/usecases/get_available_slots.dart';
import 'package:pooja_sindhu/features/booking/presentation/providers/booking_providers.dart';
import 'package:table_calendar/table_calendar.dart';

class SlotPicker extends ConsumerStatefulWidget {
  const SlotPicker({
    super.key,
    required this.panditId,
    required this.onSlotSelected,
  });

  final String panditId;
  final ValueChanged<DateTime> onSlotSelected;

  @override
  ConsumerState<SlotPicker> createState() => _SlotPickerState();
}

class _SlotPickerState extends ConsumerState<SlotPicker> {
  var _selected = DateTime.now();
  late Future<List<DateTime>> _slots;

  @override
  void initState() {
    super.initState();
    _slots = _load(_selected);
  }

  Future<List<DateTime>> _load(DateTime date) async {
    final result = await GetAvailableSlots(ref.read(bookingRepositoryProvider))(
      panditId: widget.panditId,
      date: date,
    );
    return result.fold(
      (failure) => throw failure,
      (slots) => slots
          .where((slot) => slot.isAvailable)
          .map((slot) => slot.startTime)
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<DateTime>(
          firstDay: DateTime.now(),
          lastDay: DateTime.now().add(const Duration(days: 90)),
          focusedDay: _selected,
          selectedDayPredicate: (day) => isSameDay(day, _selected),
          onDaySelected: (day, _) => setState(() {
            _selected = day;
            _slots = _load(day);
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Text(
            'Available times - ${DateFormat('d MMMM').format(_selected)}',
          ),
        ),
        FutureBuilder<List<DateTime>>(
          future: _slots,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (snapshot.data!.isEmpty) {
              return const Text('No slots available on this day.');
            }
            return Wrap(
              spacing: AppSpacing.sm,
              children: snapshot.data!
                  .map(
                    (slot) => ChoiceChip(
                      label: Text(DateFormat('h:mm a').format(slot)),
                      selected: false,
                      onSelected: (_) => widget.onSlotSelected(slot),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
