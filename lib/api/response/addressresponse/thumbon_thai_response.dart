import '../../model/addressmodel/thumbon_thai_model.dart';
import '../base_response.dart';

class ThumbonThaiResponse extends BaseResponse {
  List<ThumbonThaiRegisModel> thumbonData = [];

  ThumbonThaiResponse({dynamic json}) : super(json);

  factory ThumbonThaiResponse.fromJson(Map<String, dynamic> json) {
    ThumbonThaiResponse response = ThumbonThaiResponse(json: json);

    if (json['data'] != null) {
      var list = json['data'] as List;
      List<ThumbonThaiRegisModel> typeList =
          list.map((data) => ThumbonThaiRegisModel.fromJson(data)).toList();
      response.thumbonData = typeList;
    }

    return response;
  }
}
