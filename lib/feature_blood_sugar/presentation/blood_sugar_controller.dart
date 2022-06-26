import 'package:blood_sugar/core/resources/data_state.dart';
import 'package:blood_sugar/core/utils/dart_utils.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/entity/blood_sugar_entity.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/entity/blood_sugar_result_entity.dart';
import 'package:blood_sugar/feature_blood_sugar/domain/usecase/blood_sugar_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodSugarController extends GetxController {
  final BloodSugarUseCase _bloodSugarUseCase;
  RxBool isLoading = false.obs;
  Rx<int> currentPage = 1.obs;
  Rxn<int> count = Rxn<int>();
  String limit = '12';
  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<bool> isBottom = false.obs;
  Rx<bool> isFirstLoadRunning = false.obs;
  Rx<bool> hasNextPage = true.obs;
  Rx<bool> isLoadMoreRunning = false.obs;

  RxList<BloodSugarResultEntity> bloodSugarList =
      <BloodSugarResultEntity>[].obs;

  BloodSugarController(
    this._bloodSugarUseCase,
  );

  Future<DataState<BloodSugarEntity>> getFirstBloodSugar(
      {required String limit, required int page}) async {
    isFirstLoadRunning.value = true;
    var dataState =
        await _bloodSugarUseCase.call(params: {'limit': limit, 'page': page});
    if (dataState is DataSuccess) {
      isLoading.value = false;
      final data = dataState.data;
      data?.let((response) {
        if (response.results.isNotEmpty) {
          bloodSugarList(response.results);

          isFirstLoadRunning.value = false;
        }
      });
    }
    if (dataState is DataFailed) {}
    isFirstLoadRunning.value = false;
    return dataState;
  }

  Future<DataState<BloodSugarEntity>?> loadMoreBloodSugar(
      {required String limit}) async {
    {
      if (hasNextPage.value &&
          !isFirstLoadRunning.value &&
          !isLoadMoreRunning.value
          ) {
        isLoadMoreRunning.value = true;
        currentPage.value += 1;
        var dataState = await _bloodSugarUseCase
            .call(params: {'limit': limit, 'page': currentPage.value});
        if (dataState is DataSuccess) {
          final data = dataState.data;
          data?.let((response) {
            if (response.results.isNotEmpty) {
              bloodSugarList.addAll(response.results);
              count.value = response.count;
              if (bloodSugarList.length == count.value) {
                hasNextPage.value = false;
              }
            } else {
              hasNextPage.value = false;
            }
          });
        }
        if (dataState is DataFailed) {
          hasNextPage.value = false;
        }
        isLoadMoreRunning.value = false;
        return dataState;
      } else {}
    }
  }
}
