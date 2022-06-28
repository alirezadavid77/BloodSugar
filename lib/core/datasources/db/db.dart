import 'package:blood_sugar/core/datasources/db/entities/blood_sample.dart';
import 'package:moor_flutter/moor_flutter.dart';


part 'db.g.dart';

@UseMoor(tables: [BloodSugarSample])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
