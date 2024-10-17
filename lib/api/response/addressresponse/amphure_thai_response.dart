import '../../model/addressmodel/amphure_thai_model.dart';
import '../base_response.dart';

class AmphureThaiResponse extends BaseResponse {
  List<AmphureThaiRegisModel> amphureData = [];

  AmphureThaiResponse({dynamic json}) : super(json);

  factory AmphureThaiResponse.fromJson(Map<String, dynamic> json) {
    AmphureThaiResponse response = AmphureThaiResponse(json: json);

    if (json['data'] != null) {
      var list = json['data'] as List;
      List<AmphureThaiRegisModel> typeList =
      list.map((data) => AmphureThaiRegisModel.fromJson(data)).toList();
      response.amphureData = typeList;
    }

    return response;
  }
}
