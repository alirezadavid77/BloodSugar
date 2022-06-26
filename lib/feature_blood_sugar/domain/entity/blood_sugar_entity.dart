import 'blood_sugar_result_entity.dart';

class BloodSugarEntity {
  int count;
  dynamic next;
  dynamic previous;
  dynamic hba1c;
  List<BloodSugarResultEntity> results;


  BloodSugarEntity({
    required this.count,
    this.next,
    this.previous,
    this.hba1c,
    required this.results,
  });

}