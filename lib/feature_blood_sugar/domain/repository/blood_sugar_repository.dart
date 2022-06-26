
import 'package:blood_sugar/core/resources/data_state.dart';

import '../entity/blood_sugar_entity.dart';


abstract class BloodSugarRepository {

  Future<DataState<BloodSugarEntity>> getSugarBloodList({required String limit,required int page});



}
