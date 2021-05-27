import 'package:dio/dio.dart';

class NetworkInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    String endpoint = options.path;
    print("Request: $endpoint\n<-- ${options.data}");
    // // print("<-- ${options.queryParameters}");
    // final user = sl.get<UserService>().user;
    // if (user != null) {
    //   IdTokenResult authToken = await user.getIdTokenResult();
    //   //breakpoint
    //   options.headers['AUTH_TOKEN'] = authToken.token
    // }
    return options;
  }

  @override
  Future<dynamic> onError(DioError dioError) async {
    String endpoint = dioError.request.path;
    print("Error at endpoint: $endpoint\n<-- $dioError");
    return dioError;
  }

  @override
  Future<dynamic> onResponse(Response response) async {
    print("Response: \n<-- $response");
    return response;
  }
}



