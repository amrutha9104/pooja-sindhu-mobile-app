import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/errors/failures.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking_draft.dart';
import 'package:pooja_sindhu/features/booking/domain/repositories/booking_repository.dart';
class CreateBooking { const CreateBooking(this._repository); final BookingRepository _repository; Future<Either<Failure, Booking>> call(BookingDraft draft) { assert(draft.isReadyToConfirm, 'Draft must be complete before creating a booking'); return _repository.createBooking(ritualId: draft.ritualId!, panditId: draft.panditId!, scheduledAt: draft.selectedSlot!, userAddress: draft.userAddress, notes: draft.notes); } }
