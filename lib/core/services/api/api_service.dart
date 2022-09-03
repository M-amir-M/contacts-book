import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:stdev/core/data/models/result/result.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/services/shared_preferences/shared_preferences.dart';
import 'package:stdev/core/utils/log.dart';
import 'api_path.dart';
import 'dio_provider.dart';

/// ApiService is a singleton class that provide REST connection
/// every api in this class should be documented, for sample documentation
class ApiService {
  static BaseOptions _options = BaseOptions(
    baseUrl: ApiPath.baseUrl,
    connectTimeout: 30000,
    receiveTimeout: 30000,
    sendTimeout: 30000,
    contentType: ContentType.json.value,
  );

  static DioProvider<Result>? _dio, _tokenDio;
  static SharedPreferencesHelper? _preferencesHelper;

  //constructors
  ApiService(SharedPreferencesHelper preferencesHelper, {bool logger = false}) {
    _initFields(preferencesHelper, logger);
  }

  //main methods................................................................
  void _initFields(SharedPreferencesHelper? helper,
      [bool logger = true]) async {
    if (_preferencesHelper == null) {
      _preferencesHelper = helper;
    }
    //set default headers

    _options.headers = {
      'Accept': 'application/json',
      'x-api-key': '62e3e6d11894fe7edea71921',
    };

    _tokenDio = DioProvider(
      _options.baseUrl,
      ResultParser.parseResult,
      ResultParser.parseError,
      baseOptions: _options,
      logger: logger,
    );

    _dio = DioProvider(
      _options.baseUrl,
      ResultParser.parseResult,
      ResultParser.parseError,
      baseOptions: _options,
      logger: logger,
    );

    _setInterceptors();
  }

  void _setInterceptors() {
    _dio?.addInterceptor(
      InterceptorsWrapper(
        ///we use Interceptors to add user selected language to header
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) async {
          try {
            //error with response data

            if (error.type == DioErrorType.response &&
                error.response?.data != null) {
              if (error.response?.statusCode == 401) {
                var token = await _preferencesHelper?.getAuth();
                if (token != null) {
                  await _preferencesHelper?.removeAuth();
                  
                }
                await Get.offNamed(RoutePath.signIn);
              }
            }
          } catch (error, stack) {
            logError(error: error, stack: stack);
          }
          return handler.next(error);
        },
      ),
    );
  }

  //interceptor methods.........................................................

  //Api.........................................................................

  //..........................................
  // Auth
  //..........................................

  Future<Result> signIn(var data) async {
    return await _dio!.requestApi(
      ApiPath.signin,
      DioProvider.POST_METHOD,
      data: data.toJson(),
    );
  }

  //..........................................
  // Contacts
  //..........................................

  Future<Result> getContactList({Map<String, dynamic>? paramaters}) async {
    return await _dio!.requestApi(
      ApiPath.contactList,
      DioProvider.GET_METHOD,
      queryParameters: paramaters,
    );
  }

  Future<Result> editContact(String id,{Map<String, dynamic>? data}) async {
    return await _dio!.requestApi(
      ApiPath.editContact.replaceAll("{id}", id),
      DioProvider.PUT_METHOD,
      data: data,
    );
  }

  Future<Result> createContact({Map<String, dynamic>? data}) async {
    return await _dio!.requestApi(
      ApiPath.createContact,
      DioProvider.POST_METHOD,
      data: data,
    );
  }
  
  Future<Result> deleteContact(String id) async {
    return await _dio!.requestApi(
      ApiPath.deleteContact.replaceAll("{id}", id),
      DioProvider.DELETE_METHOD,
    );
  }
}
