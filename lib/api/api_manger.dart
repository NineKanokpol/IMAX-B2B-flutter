import 'dart:convert';

import 'package:http/http.dart' as Http;

import '../appManager/app_config.dart';

class ApiManager {
  ApplicationEnv applicationEnv = ApplicationEnv.dev;

  String get domainManageMainV1 {
    if (applicationEnv == ApplicationEnv.prd) {
      return "https://nexgencommerce.one.th/api/backend/";
    } else if (applicationEnv == ApplicationEnv.uat) {
      return "https://uatinet-eprocurement.one.th/api/backend/";
    } else if (applicationEnv == ApplicationEnv.dev) {
      return "https://devinet-eprocurement.one.th/api/backend/";
    } else {
      return "";
    }
  }

  String get domainThailandData {
    return 'https://raw.githubusercontent.com/kongvut/thai-province-data/master';
  }

  String accessToken = "";

  static String getProvinceThai = '/api_province.json';
  static String getAmphureThai = '/api_amphure.json';
  static String getTambonThai = '/api_tambon.json';

  Future<dynamic> requestGet(String domain, String apiName) async {
    Uri domainUri = Uri.parse(domain + apiName);
    Http.Response response = await Http.get(domainUri);
    print('domainUri : ${domainUri}');
    print("accessToken : ${accessToken}");

    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401 && accessToken != '') {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    }
  }
}
