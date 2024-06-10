import 'package:dio/dio.dart';
import 'package:myapp/core/api/api_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'api_injection.g.dart';

@riverpod
Dio apiInjection(ApiInjectionRef ref, Map<String,dynamic> requestData) => ApiManager().managerApi(requestData["url"], requestData['auth']);