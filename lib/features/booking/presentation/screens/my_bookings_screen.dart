import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/features/booking/presentation/providers/booking_history_provider.dart';
import 'package:pooja_sindhu/features/booking/presentation/widgets/booking_card.dart';
import 'package:pooja_sindhu/shared/widgets/empty_state_view.dart';
import 'package:pooja_sindhu/shared/widgets/error_retry_view.dart';
class MyBookingsScreen extends ConsumerWidget { const MyBookingsScreen({super.key}); @override Widget build(BuildContext context, WidgetRef ref) { final result = ref.watch(bookingHistoryProvider); return Scaffold(appBar: AppBar(title: const Text('My Bookings')), body: result.when(data: (bookings) => bookings.isEmpty ? const EmptyStateView(title: 'No bookings yet', message: 'Your confirmed bookings will appear here.', icon: Icons.event_available_outlined) : RefreshIndicator(onRefresh: () async => ref.invalidate(bookingHistoryProvider), child: ListView(children: bookings.map((booking) => BookingCard(booking: booking)).toList())), loading: () => const Center(child: CircularProgressIndicator()), error: (error, _) => ErrorRetryView(message: error.toString(), onRetry: () => ref.invalidate(bookingHistoryProvider)))); } }
