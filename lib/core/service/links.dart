import '../const_data/const_data.dart';

class AppLinks {
  static String appRoot = "https://";
  static String reg = "127.0.0.1";
  static String imageWithRoot = "$appRoot/storage/";

  static String imageWithoutRoot = "$appRoot";

  static String serverApiRoot = "$appRoot/api";

  static String login = "$serverApiRoot/login";

  static String home = "$serverApiRoot/home";

  // return without token
  Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };
    return mainHeader;
  }

  Map<String, String> getHeaderToken() {
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      "Authorization": 'Bearer${ConstantData.token}'
    };
    return mainHeader;
  }
}
