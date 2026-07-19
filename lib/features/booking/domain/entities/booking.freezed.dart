// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Booking {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get ritualId => throw _privateConstructorUsedError;
  String get ritualName => throw _privateConstructorUsedError;
  String get panditId => throw _privateConstructorUsedError;
  String get panditName => throw _privateConstructorUsedError;
  String? get panditPhotoUrl => throw _privateConstructorUsedError;
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  BookingStatus get status => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String? get userAddress => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String ritualId,
      String ritualName,
      String panditId,
      String panditName,
      String? panditPhotoUrl,
      DateTime scheduledAt,
      BookingStatus status,
      double totalAmount,
      String? userAddress,
      String? notes,
      DateTime? cancelledAt,
      String? cancellationReason,
      DateTime createdAt});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? ritualId = null,
    Object? ritualName = null,
    Object? panditId = null,
    Object? panditName = null,
    Object? panditPhotoUrl = freezed,
    Object? scheduledAt = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? userAddress = freezed,
    Object? notes = freezed,
    Object? cancelledAt = freezed,
    Object? cancellationReason = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ritualId: null == ritualId
          ? _value.ritualId
          : ritualId // ignore: cast_nullable_to_non_nullable
              as String,
      ritualName: null == ritualName
          ? _value.ritualName
          : ritualName // ignore: cast_nullable_to_non_nullable
              as String,
      panditId: null == panditId
          ? _value.panditId
          : panditId // ignore: cast_nullable_to_non_nullable
              as String,
      panditName: null == panditName
          ? _value.panditName
          : panditName // ignore: cast_nullable_to_non_nullable
              as String,
      panditPhotoUrl: freezed == panditPhotoUrl
          ? _value.panditPhotoUrl
          : panditPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
          _$BookingImpl value, $Res Function(_$BookingImpl) then) =
      __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String ritualId,
      String ritualName,
      String panditId,
      String panditName,
      String? panditPhotoUrl,
      DateTime scheduledAt,
      BookingStatus status,
      double totalAmount,
      String? userAddress,
      String? notes,
      DateTime? cancelledAt,
      String? cancellationReason,
      DateTime createdAt});
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
      _$BookingImpl _value, $Res Function(_$BookingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? ritualId = null,
    Object? ritualName = null,
    Object? panditId = null,
    Object? panditName = null,
    Object? panditPhotoUrl = freezed,
    Object? scheduledAt = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? userAddress = freezed,
    Object? notes = freezed,
    Object? cancelledAt = freezed,
    Object? cancellationReason = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$BookingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ritualId: null == ritualId
          ? _value.ritualId
          : ritualId // ignore: cast_nullable_to_non_nullable
              as String,
      ritualName: null == ritualName
          ? _value.ritualName
          : ritualName // ignore: cast_nullable_to_non_nullable
              as String,
      panditId: null == panditId
          ? _value.panditId
          : panditId // ignore: cast_nullable_to_non_nullable
              as String,
      panditName: null == panditName
          ? _value.panditName
          : panditName // ignore: cast_nullable_to_non_nullable
              as String,
      panditPhotoUrl: freezed == panditPhotoUrl
          ? _value.panditPhotoUrl
          : panditPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$BookingImpl implements _Booking {
  const _$BookingImpl(
      {required this.id,
      required this.userId,
      required this.ritualId,
      required this.ritualName,
      required this.panditId,
      required this.panditName,
      this.panditPhotoUrl,
      required this.scheduledAt,
      required this.status,
      required this.totalAmount,
      this.userAddress,
      this.notes,
      this.cancelledAt,
      this.cancellationReason,
      required this.createdAt});

  @override
  final String id;
  @override
  final String userId;
  @override
  final String ritualId;
  @override
  final String ritualName;
  @override
  final String panditId;
  @override
  final String panditName;
  @override
  final String? panditPhotoUrl;
  @override
  final DateTime scheduledAt;
  @override
  final BookingStatus status;
  @override
  final double totalAmount;
  @override
  final String? userAddress;
  @override
  final String? notes;
  @override
  final DateTime? cancelledAt;
  @override
  final String? cancellationReason;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Booking(id: $id, userId: $userId, ritualId: $ritualId, ritualName: $ritualName, panditId: $panditId, panditName: $panditName, panditPhotoUrl: $panditPhotoUrl, scheduledAt: $scheduledAt, status: $status, totalAmount: $totalAmount, userAddress: $userAddress, notes: $notes, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.ritualId, ritualId) ||
                other.ritualId == ritualId) &&
            (identical(other.ritualName, ritualName) ||
                other.ritualName == ritualName) &&
            (identical(other.panditId, panditId) ||
                other.panditId == panditId) &&
            (identical(other.panditName, panditName) ||
                other.panditName == panditName) &&
            (identical(other.panditPhotoUrl, panditPhotoUrl) ||
                other.panditPhotoUrl == panditPhotoUrl) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.userAddress, userAddress) ||
                other.userAddress == userAddress) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      ritualId,
      ritualName,
      panditId,
      panditName,
      panditPhotoUrl,
      scheduledAt,
      status,
      totalAmount,
      userAddress,
      notes,
      cancelledAt,
      cancellationReason,
      createdAt);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);
}

abstract class _Booking implements Booking {
  const factory _Booking(
      {required final String id,
      required final String userId,
      required final String ritualId,
      required final String ritualName,
      required final String panditId,
      required final String panditName,
      final String? panditPhotoUrl,
      required final DateTime scheduledAt,
      required final BookingStatus status,
      required final double totalAmount,
      final String? userAddress,
      final String? notes,
      final DateTime? cancelledAt,
      final String? cancellationReason,
      required final DateTime createdAt}) = _$BookingImpl;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get ritualId;
  @override
  String get ritualName;
  @override
  String get panditId;
  @override
  String get panditName;
  @override
  String? get panditPhotoUrl;
  @override
  DateTime get scheduledAt;
  @override
  BookingStatus get status;
  @override
  double get totalAmount;
  @override
  String? get userAddress;
  @override
  String? get notes;
  @override
  DateTime? get cancelledAt;
  @override
  String? get cancellationReason;
  @override
  DateTime get createdAt;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
