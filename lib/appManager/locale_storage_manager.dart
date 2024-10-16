import 'package:jwt_decode/jwt_decode.dart';
import 'package:localstorage/localstorage.dart';

class LocaleStorageManager {
  static final LocalStorage storage = new LocalStorage('MyApp');

  static final String ACCESSTOKEN = 'ACCESSTOKEN';

  static Future<void> saveAccessToken(dynamic value) async {
    await storage.ready;
    print("saveAccessToken");
    print(value);
    return storage.setItem(ACCESSTOKEN, value);
  }

 /* static Future<accesstokenModel?> getAccessToken() async {
    await storage.ready;
    var getToken = storage.getItem(ACCESSTOKEN);
    if (getToken == null) {
      var response = accesstokenModel();
      return response;
    }
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getToken);
    var response = accesstokenModel.fromJson(storageData);

    if (response.accessToken != '' && response.refreshToken != '') {
      bool accessTokenExpired = Jwt.isExpired(response.accessToken);
      if (accessTokenExpired == true) {
        RefreshTokenRequest requestReNew = RefreshTokenRequest();
        requestReNew.refreshToken = response.refreshToken;
        Uri domainUri = Uri.parse(
            ApiManager().domainAuthentication + ApiManager.postRefreshToken);
        Map<String, String> renewHeader = {
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $response.accessToken'
        };
        Http.Response responseApi = await Http.post(domainUri,
            headers: renewHeader, body: jsonEncode(requestReNew.toJson()));
        if (responseApi.statusCode == 200) {
          var jsonBody = json.decode(utf8.decode(responseApi.bodyBytes));
          var data = accesstokenModel.fromJson(jsonBody);
          return data;
        } else if (responseApi.statusCode == 401) {
          LocalStorageManager().refreshLogin();
          return response;
        } else {
          return response;
        }
      } else {
        return response;
      }
    } else {
      return response;
    }
  }*/

}
