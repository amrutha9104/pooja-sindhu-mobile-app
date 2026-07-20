import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/errors/failures.dart';
import 'package:pooja_sindhu/features/booking/data/datasources/booking_remote_datasource.dart';
import 'package:pooja_sindhu/features/booking/data/models/booking_model.dart';
import 'package:pooja_sindhu/features/booking/data/models/time_slot_model.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/booking.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/time_slot.dart';
import 'package:pooja_sindhu/features/booking/domain/repositories/booking_repository.dart';
class BookingRepositoryImpl implements BookingRepository {
  const BookingRepositoryImpl(this._dataSource); final BookingRemoteDataSource _dataSource;
  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action, String fallback) async { try { return Right(await action()); } on DioException catch (e) { return Left(ServerFailure(e.message ?? fallback)); } catch (e) { return Left(ServerFailure(e.toString())); } }
  @override Future<Either<Failure, List<TimeSlot>>> getAvailableSlots({required String panditId, required DateTime date}) => _guard(() async => (await _dataSource.getAvailableSlots(panditId: panditId, date: date)).map((model) => model.toDomain()).toList(), 'Unable to load available slots');
  @override Future<Either<Failure, Booking>> createBooking({required String ritualId, required String panditId, required DateTime scheduledAt, String? userAddress, String? notes}) async { try { return Right((await _dataSource.createBooking(ritualId: ritualId, panditId: panditId, scheduledAt: scheduledAt, userAddress: userAddress, notes: notes)).toDomain()); } on DioException catch (e) { return Left(ServerFailure(e.response?.statusCode == 409 ? 'This slot is no longer available. Please choose another time.' : e.message ?? 'Booking failed')); } catch (e) { return Left(ServerFailure(e.toString())); } }
  @override Future<Either<Failure, List<Booking>>> getUserBookings() => _guard(() async => (await _dataSource.getUserBookings()).map((model) => model.toDomain()).toList(), 'Failed to load bookings');
  @override Future<Either<Failure, Booking>> getBookingById(String id) => _guard(() async => (await _dataSource.getBookingById(id)).toDomain(), 'Booking not found');
  @override Future<Either<Failure, Booking>> cancelBooking(String id) => _guard(() async => (await _dataSource.cancelBooking(id)).toDomain(), 'Cancellation failed');
}
