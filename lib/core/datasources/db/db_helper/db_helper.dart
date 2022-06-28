import 'package:blood_sugar/core/datasources/db/db.dart';
import 'package:blood_sugar/core/datasources/db/entities/blood_sample.dart';
import 'package:blood_sugar/core/utils/utils.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'db_helper.g.dart';

@UseDao(tables: [BloodSugarSample])

class DbHelper extends DatabaseAccessor<AppDatabase> with _$DbHelperMixin {
  DbHelper(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<BloodSugarSampleData>> getAllBloodSugar() => select(bloodSugarSample).get();
  Stream<List<BloodSugarSampleData>> watchAllBloodSugar() => select(bloodSugarSample).watch();
  Future insertNewBloodSugar(BloodSugarSampleData order) => into(bloodSugarSample).insertOnConflictUpdate(order);
  Future deleteAllBloodSugar() => delete(bloodSugarSample).go();

}
