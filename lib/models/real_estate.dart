

class Get {
    int packageId;
    int packageCode;
    String packageName;
    dynamic permalink;
    String packageDesc;
    String featureImg;
    dynamic locationId;
    dynamic comunityId;
    dynamic createdAt;
    dynamic updatedAt;

    Get({
        required this.packageId,
        required this.packageCode,
        required this.packageName,
        this.permalink,
        required this.packageDesc,
        required this.featureImg,
        this.locationId,
        this.comunityId,
        this.createdAt,
        this.updatedAt,
    });

    factory Get.fromJson(Map<String, dynamic> json) => Get(
        packageId: json["package_id"],
        packageCode: json["package_code"],
        packageName: json["package_name"],
        permalink: json["permalink"],
        packageDesc: json["package_desc"],
        featureImg: json["feature_img"],
        locationId: json["location_id"],
        comunityId: json["comunity_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

  get user => null;

  String get judul => '';

  get image => null;

  get id => null;

  get deskripsi => null;

  get status => null;

    Map<String, dynamic> toJson() => {
        "package_id": packageId,
        "package_code": packageCode,
        "package_name": packageName,
        "permalink": permalink,
        "package_desc": packageDesc,
        "feature_img": featureImg,
        "location_id": locationId,
        "comunity_id": comunityId,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
