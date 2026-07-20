import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking_status.dart';
part 'booking_model.freezed.dart';
part 'booking_model.g.dart';
@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({required String id, required String userId, required String ritualId, required String ritualName, required String panditId, required String panditName, String? panditPhotoUrl, required DateTime scheduledAt, required String status, required double totalAmount, String? userAddress, String? notes, DateTime? cancelledAt, String? cancellationReason, required DateTime createdAt}) = _BookingModel;
  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}
extension BookingModelX on BookingModel {
  Booking toDomain() => Booking(id: id, userId: userId, ritualId: ritualId, ritualName: ritualName, panditId: panditId, panditName: panditName, panditPhotoUrl: panditPhotoUrl, scheduledAt: scheduledAt, status: _parseStatus(status), totalAmount: totalAmount, userAddress: userAddress, notes: notes, cancelledAt: cancelledAt, cancellationReason: cancellationReason, createdAt: createdAt);
  BookingStatus _parseStatus(String value) => switch (value) { 'draft' => BookingStatus.draft, 'pending_payment' || 'pendingPayment' => BookingStatus.pendingPayment, 'confirmed' => BookingStatus.confirmed, 'payment_failed' || 'paymentFailed' => BookingStatus.paymentFailed, 'cancelled' => BookingStatus.cancelled, 'completed' => BookingStatus.completed, _ => BookingStatus.draft };
}
