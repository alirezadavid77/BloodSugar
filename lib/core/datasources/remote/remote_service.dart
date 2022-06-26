import 'dart:io';

import 'package:blood_sugar/core/constants/constants.dart';
import 'package:blood_sugar/feature_blood_sugar/data/dto/blood_sugar_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class RemoteService {
  factory RemoteService(Dio dio, {String baseUrl}) = _RemoteService;

  @GET('patients/me/health-data/blood-sugar/v1/')
  Future<HttpResponse<BloodSugarDto>> getsSugarBlood({
    @Query('limit') required String limit,
    @Query('page') required int page,

  });


}
