import 'package:dio/dio.dart';
import 'package:pooja_sindhu/features/booking/data/models/booking_model.dart';
import 'package:pooja_sindhu/features/booking/data/models/time_slot_model.dart';

abstract interface class BookingRemoteDataSource {
  Future<List<TimeSlotModel>> getAvailableSlots({
    required String panditId,
    required DateTime date,
  });

  Future<BookingModel> createBooking({
    required String ritualId,
    required String panditId,
    required DateTime scheduledAt,
    String? userAddress,
    String? notes,
  });

  Future<List<BookingModel>> getUserBookings();
  Future<BookingModel> getBookingById(String id);
  Future<BookingModel> cancelBooking(String id);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  const BookingRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<TimeSlotModel>> getAvailableSlots({
    required String panditId,
    required DateTime date,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/v1/pandits/$panditId/slots',
      queryParameters: {'date': date.toIso8601String().split('T').first},
    );
    final data = response.data?['data'] as List<dynamic>;
    return data
        .map((e) => TimeSlotModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<BookingModel> createBooking({
    required String ritualId,
    required String panditId,
    required DateTime scheduledAt,
    String? userAddress,
    String? notes,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/bookings',
      data: {
        'ritualId': ritualId,
        'panditId': panditId,
        'scheduledAt': scheduledAt.toIso8601String(),
        if (userAddress != null) 'userAddress': userAddress,
        if (notes != null) 'notes': notes,
      },
    );
    return BookingModel.fromJson(
      response.data?['data'] as Map<String, dynamic>,
    );
  }

  @override
  Future<List<BookingModel>> getUserBookings() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/v1/bookings');
    final data = response.data?['data'] as List<dynamic>;
    return data
        .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<BookingModel> getBookingById(String id) async {
    final response =
        await _dio.get<Map<String, dynamic>>('/api/v1/bookings/$id');
    return BookingModel.fromJson(
      response.data?['data'] as Map<String, dynamic>,
    );
  }

  @override
  Future<BookingModel> cancelBooking(String id) async {
    final response =
        await _dio.patch<Map<String, dynamic>>('/api/v1/bookings/$id/cancel');
    return BookingModel.fromJson(
      response.data?['data'] as Map<String, dynamic>,
    );
  }
}
