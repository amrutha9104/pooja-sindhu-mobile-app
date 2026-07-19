import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/core/network/api_client.dart';
import 'package:pooja_sindhu/features/booking/data/datasources/booking_remote_datasource.dart';
import 'package:pooja_sindhu/features/booking/data/repositories/booking_repository_impl.dart';
import 'package:pooja_sindhu/features/booking/domain/repositories/booking_repository.dart';
final bookingRemoteDataSourceProvider = Provider<BookingRemoteDataSource>((ref) => BookingRemoteDataSourceImpl(ref.watch(dioProvider)));
final bookingRepositoryProvider = Provider<BookingRepository>((ref) => BookingRepositoryImpl(ref.watch(bookingRemoteDataSourceProvider)));
