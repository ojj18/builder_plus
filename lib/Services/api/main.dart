import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(
        uri,
        body,
        headers: {
          'content-type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(minutes: 5));
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
  Future<Response> getData(String uri, String? userToken) async {
    try {
      Response response = await get(
        uri,
        headers: {
          'content-type': 'application/json; charset=UTF-8',
          'token': userToken!
        },
      );
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
 
}
