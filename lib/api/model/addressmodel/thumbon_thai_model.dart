class ThumbonThaiRegisModel {
  int? id;
  int? zipCode;
  String? nameTh;
  String? nameEn;
  int? amphureId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ThumbonThaiRegisModel(
      {this.id,
        this.zipCode,
        this.nameTh,
        this.nameEn,
        this.amphureId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ThumbonThaiRegisModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zipCode = json['zip_code'];
    nameTh = json['name_th'];
    nameEn = json['name_en'];
    amphureId = json['amphure_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zip_code'] = this.zipCode;
    data['name_th'] = this.nameTh;
    data['name_en'] = this.nameEn;
    data['amphure_id'] = this.amphureId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}