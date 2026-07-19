import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking_draft.dart';
import 'package:pooja_sindhu/shared/widgets/app_primary_button.dart';
class BookingReviewStep extends StatelessWidget { const BookingReviewStep({super.key, required this.draft, required this.onConfirm}); final BookingDraft draft; final VoidCallback onConfirm; @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Review your Booking', style: Theme.of(context).textTheme.titleLarge), Text('Ritual: ${draft.ritualName ?? '—'}'), Text('Pandit: ${draft.panditName ?? '—'}'), Text('Date & Time: ${draft.selectedSlot == null ? '—' : DateFormat('EEE, d MMM y • h:mm a').format(draft.selectedSlot!)}'), const Spacer(), AppPrimaryButton(label: 'Confirm & Proceed to Payment', onPressed: onConfirm)])); }
