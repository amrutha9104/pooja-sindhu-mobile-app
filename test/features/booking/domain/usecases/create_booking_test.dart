import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pooja_sindhu/core/errors/failures.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking_draft.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking_status.dart';
import 'package:pooja_sindhu/features/booking/domain/repositories/booking_repository.dart';
import 'package:pooja_sindhu/features/booking/domain/usecases/create_booking.dart';

class MockBookingRepository extends Mock implements BookingRepository {}

void main() {
  test('returns booking on success', () async {
    final repository = MockBookingRepository();
    final draft = BookingDraft(
      ritualId: 'ritual',
      panditId: 'pandit',
      selectedSlot: DateTime(2026),
    );
    final booking = Booking(
      id: 'booking',
      userId: 'user',
      ritualId: 'ritual',
      ritualName: 'Puja',
      panditId: 'pandit',
      panditName: 'Pandit',
      scheduledAt: draft.selectedSlot!,
      status: BookingStatus.pendingPayment,
      totalAmount: 1,
      createdAt: DateTime(2026),
    );

    when(
      () => repository.createBooking(
        ritualId: 'ritual',
        panditId: 'pandit',
        scheduledAt: draft.selectedSlot!,
        userAddress: null,
        notes: null,
      ),
    ).thenAnswer((_) async => Right<Failure, Booking>(booking));

    expect(
      await CreateBooking(repository)(draft),
      Right<Failure, Booking>(booking),
    );
  });
}
