class BaseResponse {
  String? type = "";
  String? detail = "";
  int? statusCode = 200;
  String? title = "";

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(json);
  }

  BaseResponse(Map<String, dynamic> json) {
    type = json['type'] ?? "";
    detail = json['detail'] ?? "";
    statusCode = json['statusCode'] ?? 200;
    title = json['title'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['detail'] = this.detail;
    data['statusCode'] = this.statusCode;
    data['title'] = this.title;
    return data;
  }
}