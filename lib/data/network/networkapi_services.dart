import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:eassy_rokkad/data/app_excaptions.dart';
import 'package:eassy_rokkad/data/network/base_apiservice.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responsejson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responsejson;
  }

  @override
  Future getPostApiResponse(String url) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnaurthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error with status code ${response.statusCode.toString()}");
    }
  }
}
