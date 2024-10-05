import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:homework_list/core/class/status_request.dart';

import 'package:http/http.dart' as http;

import 'check_internet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map data, Map<String, String> header) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl),
            body: jsonEncode(data), headers: header);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          //   print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      // print(_);
      return const Left(StatusRequest.serverFailure);
    }
  }
}
