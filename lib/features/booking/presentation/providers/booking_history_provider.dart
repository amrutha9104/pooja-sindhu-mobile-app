import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/usecases/get_user_bookings.dart';
import 'package:pooja_sindhu/features/booking/presentation/providers/booking_providers.dart';
final bookingHistoryProvider = FutureProvider<List<Booking>>((ref) async { final result = await GetUserBookings(ref.watch(bookingRepositoryProvider))(); return result.fold((failure) => throw failure, (bookings) => bookings); });
