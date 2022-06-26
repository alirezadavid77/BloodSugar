
import 'package:blood_sugar/core/resources/data_state.dart';
import 'package:blood_sugar/core/usecase/usecase.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/entity/blood_sugar_entity.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/repository/blood_sugar_repository.dart';

class BloodSugarUseCase implements UseCase<DataState<BloodSugarEntity>,  Map<String, dynamic> > {
  final BloodSugarRepository _repository;

  BloodSugarUseCase(this._repository);

  @override
  Future<DataState<BloodSugarEntity>> call({required Map<String, dynamic> params}) {
    return _repository.getSugarBloodList(limit: params['limit'],page: params['page']);
  }
}
