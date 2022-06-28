import 'package:moor/moor.dart';

class BloodSugarSample extends Table {
  TextColumn get id => text()();

  IntColumn get bloodSugar => integer().withDefault(const Constant(0))();

  TextColumn get measureState => text()();

  TextColumn get assignDate => text()();

  @override
  Set<Column> get primaryKey => {id};
}
