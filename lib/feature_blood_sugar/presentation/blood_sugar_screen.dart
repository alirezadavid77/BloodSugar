import 'package:blood_sugar/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'blood_sugar_controller.dart';

class BloodSugarScreen extends StatelessWidget {
  static const Type className = BloodSugarScreen;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final BloodSugarController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<BloodSugarController>(
      initState: (_) async {
        await _controller.getFirstBloodSugar(
            limit: _controller.limit, page: _controller.currentPage.value);
        _controller.scrollController.value.addListener(() async {
          _controller.isBottom.value =
              _controller.scrollController.value.position.pixels ==
                  _controller.scrollController.value.position.maxScrollExtent;
          if (_controller.isBottom.value) {
            await _controller.loadMoreBloodSugar(limit: _controller.limit);
          } else {}
        });
      },
      builder: (logic) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'اندازه گیری قند خون',
                  style: iransans12BoldLightBlack,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '${_controller.bloodSugarList.length}',
                  style: iransans12BoldLightBlack,
                ),
              ),
            ),
            key: _scaffoldKey,
            body: _controller.isFirstLoadRunning.value
                ? const Center(child: CircularProgressIndicator())
                : Column(children: [
                    Expanded(
                      child: ListView.builder(
                          controller: _controller.scrollController.value,
                          itemCount: _controller.bloodSugarList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: kColorPallete4,

                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _controller.bloodSugarList[index].persistenceTime.substring(11, 19),
                                            style: kLoginTitleStyle,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'mg/dl ',
                                                style: kLoginTitleStyle,
                                              ),
                                              Text(
                                                _controller.bloodSugarList[index].bloodSugar.toString(),
                                                style: kLoginTitleStyle1,
                                              ),
                                              const Icon(
                                                Icons.circle,
                                                color: kColorRed,
                                                size: 10,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _controller.bloodSugarList[index].assignDate,
                                            style: kLoginTitleStyle,
                                          ),
                                          Text(
                                            _controller.bloodSugarList[index].measureState,
                                            style: kLoginTitleStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    if (_controller.isLoadMoreRunning.value)
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    _controller.isBottom.value
                        ? !_controller.hasNextPage.value
                            ? const Center(
                                child: Text(
                                  'انتهای لیست',
                                  style: kTakePhotoProfileNumberStyle,
                                ),
                              )
                            : Container()
                        : Container()

                  ]),
          ),
        );
      },
    );
  }
}
