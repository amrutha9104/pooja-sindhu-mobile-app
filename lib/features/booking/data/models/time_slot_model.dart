import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pooja_sindhu/features/booking/domain/entities/time_slot.dart';
part 'time_slot_model.freezed.dart';
part 'time_slot_model.g.dart';
@freezed
class TimeSlotModel with _$TimeSlotModel {
  const factory TimeSlotModel({required DateTime startTime, required DateTime endTime, required bool isAvailable}) = _TimeSlotModel;
  factory TimeSlotModel.fromJson(Map<String, dynamic> json) => _$TimeSlotModelFromJson(json);
}
extension TimeSlotModelX on TimeSlotModel { TimeSlot toDomain() => TimeSlot(startTime: startTime, endTime: endTime, isAvailable: isAvailable); }
