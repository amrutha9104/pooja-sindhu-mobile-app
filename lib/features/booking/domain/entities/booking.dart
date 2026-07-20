import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking_status.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String userId,
    required String ritualId,
    required String ritualName,
    required String panditId,
    required String panditName,
    String? panditPhotoUrl,
    required DateTime scheduledAt,
    required BookingStatus status,
    required double totalAmount,
    String? userAddress,
    String? notes,
    DateTime? cancelledAt,
    String? cancellationReason,
    required DateTime createdAt,
  }) = _Booking;
}
