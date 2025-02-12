class MobileBrandModel {
  final String make;
  final String imagePath;

  MobileBrandModel({
    required this.make,
    required this.imagePath,
  });

  factory MobileBrandModel.fromJson(Map<String, dynamic> json) {
    return MobileBrandModel(
      make: json["make"] ?? "",
      imagePath: json["imagePath"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "make": make,
      "imagePath": imagePath,
    };
  }

  static List<MobileBrandModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => MobileBrandModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> listToJson(List<MobileBrandModel> brands) {
    return brands.map((brand) => brand.toJson()).toList();
  }
}
