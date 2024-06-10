
import 'package:dio/dio.dart';
import 'package:myapp/core/api/api_logging.dart';

class ApiManager {
  static final ApiManager _main = ApiManager._internal();

  factory ApiManager(){
    return _main;
  }

  ApiManager._internal();


  Dio managerApi(String url,String authToken){
    final option = BaseOptions(
      baseUrl: url, 
      connectTimeout:const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      headers: {
        'Authorization': "Bearer $authToken"
      },
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    return Dio(option)..interceptors.add(ApiLogging());
  }
    
  }
