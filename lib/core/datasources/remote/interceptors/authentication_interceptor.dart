import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthenticationInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
      var token = '5ff7037ec0daa93b1386e09d85f673c2d8402c4349587599d93ca96949d83780';
      if (kDebugMode) {
        print(token);
      }
      options.headers["Authorization"] = token;
      options.headers.addAll({"Authorization": "Token " + token});

    // }
    options.headers["Content-type"] = 'application/json';
    options.headers["Accept"] = 'application/json';
    if (kDebugMode) {
      print(options.headers);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(response.statusCode != 401) {

    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if(err.response?.statusCode == 401) {
      // getNewToken(err);
    }
    return super.onError(err, handler);
  }

}
