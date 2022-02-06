import 'package:dio/dio.dart';

import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {
        'val': LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN),
      },
    );
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);
  }
}


// import 'dart:html';

// import 'package:dio/dio.dart';
// import 'package:flutter_template_vb10/core/base/model/base_error.dart';
// import 'package:flutter_template_vb10/core/base/model/base_model.dart';
// import 'package:flutter_template_vb10/core/constants/enums/locale_keys_enum.dart';
// import 'package:flutter_template_vb10/core/init/cache/locale_manager.dart';

// class NetworkManager {
//   static NetworkManager? _instance;
//   static NetworkManager? get instance => _instance ?? NetworkManager._init();
//   late Dio _dio;
//   NetworkManager._init() {
//     final baseOptions = BaseOptions(
//       baseUrl: "https://jsonplaceholder.typicode.com/",
//       headers: {
//         'val': LocaleManager.instance!.getStringValue(PreferencesKeys.TOKEN),
//       },
//     );

//     _dio = Dio(baseOptions);

//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
//           options.path += "gokhan";

//           return handler.next(options);
//         },
//         onResponse: (Response response, ResponseInterceptorHandler handler) {
//           return handler.next(response);
//         },
//         onError: (DioError e, ErrorInterceptorHandler handler) {
//           return handler.next(e);
//         },
//       ),
//     );
//   }

//   Future dioGet<T extends BaseModel>(String path, T model) async {
//     final response = await _dio.get(path);
//     switch (response.statusCode) {
//       case HttpStatus.ok:
//         final responseBody = response.data;
//         if (responseBody is List) {
//           return responseBody.map((e) => model.fromJson(e)).toList();
//         } else if (responseBody is Map) {
//           return model.fromJson(responseBody);
//         }
//         return responseBody;
//       default:
//     }
//   }
// }