import 'package:blood_sugar/core/dataSources/remote/remote_service.dart';
import 'package:blood_sugar/feature_blood_sugar/data/repository/blood_sugar_repository_impl.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/repository/blood_sugar_repository.dart';
import 'package:get/get.dart';

import '../domain/usecase/blood_sugar_usecase.dart';
import 'blood_sugar_controller.dart';

class BloodSugarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BloodSugarController>(() => BloodSugarController(
        Get.find<BloodSugarUseCase>(),
    ));
    Get.lazyPut<BloodSugarUseCase>(() => BloodSugarUseCase(Get.find<BloodSugarRepository>()));
    Get.lazyPut<BloodSugarRepository>(() => BloodSugarRepositoryImpl(Get.find<RemoteService>()));



  }
}
