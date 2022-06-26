import 'package:blood_sugar/feature_blood_sugar/domain/entity/blood_sugar_result_entity.dart';

class BloodSugarResultDto extends BloodSugarResultEntity {
  BloodSugarResultDto({
     String? bloodSugarId,
     String? patientId,
     String? assignDate,
     String? measureTime,
     int? bloodSugar,
     String? measureState,
     String? quantifier,
     int? method,
     String? persistenceTime,
     int? tag,

  }) : super(
          bloodSugarId: bloodSugarId ?? '',
          patientId: patientId ?? '',
          assignDate: assignDate ?? '',
          measureTime: measureTime ?? '',
          bloodSugar: bloodSugar ?? -1,
          measureState: measureState ?? '',
          quantifier: quantifier ?? '',
          method: method ?? -1,
          persistenceTime: persistenceTime ?? '',
          tag: tag ?? -1,
        );

  factory BloodSugarResultDto.fromJson(Map<String, dynamic> json) =>
      BloodSugarResultDto(
        bloodSugarId: json['blood_sugar_id'],
        patientId: json["patient_id"],
        assignDate: json["assign_date"],
        measureTime: json["measure_time"],
        bloodSugar: json["blood_sugar"],
        measureState: json["measure_state"],
        quantifier: json["quantifier"],
        method: json["method"],
        persistenceTime: json["persistence_time"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {


        "blood_sugar_id":bloodSugarId,
        "patient_id":patientId,
        "assign_date": assignDate,
        "measure_time": measureTime,
        "blood_sugar": bloodSugar,
        "measure_state": measureState,
        "quantifier": quantifier,
        "method": method,
        "persistence_time": persistenceTime,
        "tag": tag,
      };
}
