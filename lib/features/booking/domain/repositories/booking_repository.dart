import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/errors/failures.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/time_slot.dart';

abstract interface class BookingRepository {
  Future<Either<Failure, List<TimeSlot>>> getAvailableSlots({required String panditId, required DateTime date});
  Future<Either<Failure, Booking>> createBooking({required String ritualId, required String panditId, required DateTime scheduledAt, String? userAddress, String? notes});
  Future<Either<Failure, List<Booking>>> getUserBookings();
  Future<Either<Failure, Booking>> getBookingById(String id);
  Future<Either<Failure, Booking>> cancelBooking(String id);
}
