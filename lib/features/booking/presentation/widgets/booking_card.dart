import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pooja_sindhu/core/theme/app_spacing.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/shared/widgets/status_badge.dart';
class BookingCard extends StatelessWidget { const BookingCard({super.key, required this.booking, this.onTap}); final Booking booking; final VoidCallback? onTap; @override Widget build(BuildContext context) => Card(child: InkWell(onTap: onTap, child: Padding(padding: const EdgeInsets.all(AppSpacing.md), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(booking.ritualName, style: Theme.of(context).textTheme.titleMedium)), StatusBadge(status: booking.status)]), const SizedBox(height: AppSpacing.xs), Text(booking.panditName), Text(DateFormat('EEE, d MMM y • h:mm a').format(booking.scheduledAt)), const SizedBox(height: AppSpacing.sm), Text('₹${booking.totalAmount.toStringAsFixed(0)}', style: Theme.of(context).textTheme.titleSmall)])))); }
