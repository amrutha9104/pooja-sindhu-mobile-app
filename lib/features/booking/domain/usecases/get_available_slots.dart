import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/errors/failures.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/time_slot.dart';
import 'package:pooja_sindhu/features/booking/domain/repositories/booking_repository.dart';
class GetAvailableSlots { const GetAvailableSlots(this._repository); final BookingRepository _repository; Future<Either<Failure, List<TimeSlot>>> call({required String panditId, required DateTime date}) => _repository.getAvailableSlots(panditId: panditId, date: date); }
