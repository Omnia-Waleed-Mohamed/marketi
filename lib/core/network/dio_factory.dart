import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  static Dio getDio (){
    Duration timeOut =const Duration(seconds: 60);
    if(dio == null ){
      dio =Dio();
      dio!..options
         .connectTimeout = timeOut
         ..options.receiveTimeout =timeOut;
    }
    return dio!;

  }


  static void addDioIntercepters(){
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,

      )
    );
  }
}
