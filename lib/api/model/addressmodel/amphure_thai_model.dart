class AmphureThaiRegisModel {
  int? id;
  String? nameTh;
  String? nameEn;
  int? provinceId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  AmphureThaiRegisModel(
      {this.id,
        this.nameTh,
        this.nameEn,
        this.provinceId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  AmphureThaiRegisModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameTh = json['name_th'];
    nameEn = json['name_en'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_th'] = this.nameTh;
    data['name_en'] = this.nameEn;
    data['province_id'] = this.provinceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}