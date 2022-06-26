
import 'package:blood_sugar/core/dataSources/remote/remote_service.dart';
import 'package:blood_sugar/core/resources/data_state.dart';
import 'package:blood_sugar/core/utils/exception_parser.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/entity/blood_sugar_entity.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/repository/blood_sugar_repository.dart';
import 'package:dio/dio.dart';


class BloodSugarRepositoryImpl implements BloodSugarRepository {
  final RemoteService _remoteService;

  const BloodSugarRepositoryImpl(this._remoteService);


  @override
  Future<DataState<BloodSugarEntity>> getSugarBloodList({required String limit,required int page})async {
    try {
      final httpResponse = await _remoteService.getsSugarBlood(limit: limit,page:page);

      if (ExceptionParser.isResponseSuccessful(httpResponse)) {
        return DataSuccess(httpResponse.data);
      }
      return ExceptionParser.getApiDioError(httpResponse);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
