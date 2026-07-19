import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/errors/failures.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/repositories/booking_repository.dart';
class CancelBooking { const CancelBooking(this._repository); final BookingRepository _repository; Future<Either<Failure, Booking>> call(String id) => _repository.cancelBooking(id); }
