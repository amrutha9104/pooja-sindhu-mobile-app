// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      ritualId: json['ritualId'] as String,
      ritualName: json['ritualName'] as String,
      panditId: json['panditId'] as String,
      panditName: json['panditName'] as String,
      panditPhotoUrl: json['panditPhotoUrl'] as String?,
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      status: json['status'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      userAddress: json['userAddress'] as String?,
      notes: json['notes'] as String?,
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      cancellationReason: json['cancellationReason'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'ritualId': instance.ritualId,
      'ritualName': instance.ritualName,
      'panditId': instance.panditId,
      'panditName': instance.panditName,
      'panditPhotoUrl': instance.panditPhotoUrl,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'status': instance.status,
      'totalAmount': instance.totalAmount,
      'userAddress': instance.userAddress,
      'notes': instance.notes,
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'cancellationReason': instance.cancellationReason,
      'createdAt': instance.createdAt.toIso8601String(),
    };
