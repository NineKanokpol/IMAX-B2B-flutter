import '../../model/addressmodel/province_thai_model.dart';
import '../base_response.dart';

class ProvinceThaiResponse extends BaseResponse {
  List<ProvinceThaiRegisModel> provinceData = [];

  ProvinceThaiResponse({dynamic json}) : super(json);

  factory ProvinceThaiResponse.fromJson(Map<String, dynamic> json) {
    ProvinceThaiResponse response = ProvinceThaiResponse(json: json);

    if (json['data'] != null) {
      var list = json['data'] as List;
      List<ProvinceThaiRegisModel> typeList =
      list.map((data) => ProvinceThaiRegisModel.fromJson(data)).toList();
      response.provinceData = typeList;
    }

    return response;
  }
}