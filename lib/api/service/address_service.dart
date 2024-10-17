import '../api_manger.dart';
import '../response/addressresponse/amphure_thai_response.dart';
import '../response/addressresponse/province_thai_response.dart';
import '../response/addressresponse/thumbon_thai_response.dart';

class AddressService {
  static Future<ProvinceThaiResponse> getProvinceThai() async {
    print('${ApiManager().domainThailandData}${ApiManager.getProvinceThai}');
    dynamic response = await ApiManager().requestGet(
        ApiManager().domainThailandData, ApiManager.getProvinceThai);
    Map<String, dynamic> json = {"data": response};
    return ProvinceThaiResponse.fromJson(json);
  }

  static Future<AmphureThaiResponse> getAmphureThai() async {
    dynamic response = await ApiManager()
        .requestGet(ApiManager().domainThailandData, ApiManager.getAmphureThai);
    Map<String, dynamic> json = {"data": response};
    return AmphureThaiResponse.fromJson(json);
  }

  static Future<ThumbonThaiResponse> getThumbonThai() async {
    dynamic response = await ApiManager()
        .requestGet(ApiManager().domainThailandData, ApiManager.getTambonThai);
    Map<String, dynamic> json = {"data": response};
    return ThumbonThaiResponse.fromJson(json);
  }
}
