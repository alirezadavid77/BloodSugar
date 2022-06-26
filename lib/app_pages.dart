import 'package:blood_sugar/feature_blood_sugar/presentation/blood_sugar_binding.dart';
import 'package:blood_sugar/feature_blood_sugar/presentation/blood_sugar_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [



    GetPage(
      name: '/${BloodSugarScreen.className}',
      page: () =>   BloodSugarScreen(),
      binding:BloodSugarBinding(),
    ),


  ];
}
