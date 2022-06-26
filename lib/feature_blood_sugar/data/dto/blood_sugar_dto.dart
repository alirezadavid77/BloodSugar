import 'dart:convert';

import 'package:blood_sugar/feature_blood_sugar/domain/entity/blood_sugar_entity.dart';

import 'blood_sugar_results_dto.dart';


BloodSugarDto darkhastListDtoFromJson(String str) => BloodSugarDto.fromJson(json.decode(str));

class BloodSugarDto extends BloodSugarEntity {
  BloodSugarDto({
    int? count,
    dynamic next,
    dynamic previous,
    List<BloodSugarResultDto>? results,
  }) : super(
          count: count ?? -1,
          next: next,
          previous: previous,
          results: results ?? [],
        );

  factory BloodSugarDto.fromJson(Map<String, dynamic> json) => BloodSugarDto(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<BloodSugarResultDto>.from(json["results"].map((x) => BloodSugarResultDto.fromJson(x))),
      );
}
