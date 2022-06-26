import 'package:blood_sugar/feature_blood_sugar/presentation/blood_sugar_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_pages.dart';
import 'core/constants/constants.dart';
import 'core/dataSources/remote/remote_service.dart';
import 'core/datasources/remote/dio/dio_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Get.lazyPut<Dio>(() => DioProvider().dio);
  Get.lazyPut<RemoteService>(() => RemoteService(Get.find<Dio>()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kColorGray,
            fontFamily: faPrimaryFontFamily,
          ),
          headline1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: faPrimaryFontFamily,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: kColorGray2,
            fontFamily: faPrimaryFontFamily,
          ),
        ),
      ),
      getPages: AppPages.pages,
      initialRoute: BloodSugarScreen.className.toString(),
      // home: MainScreen(),
    );
  }
}
