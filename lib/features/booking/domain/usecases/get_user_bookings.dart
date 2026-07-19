import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/errors/failures.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/repositories/booking_repository.dart';
class GetUserBookings { const GetUserBookings(this._repository); final BookingRepository _repository; Future<Either<Failure, List<Booking>>> call() => _repository.getUserBookings(); }
