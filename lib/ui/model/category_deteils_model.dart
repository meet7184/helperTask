class CategoryDetailsModel {
  CategoryDetailsModel({
    required this.categoryList,
    required this.success,
  });

  List<CategoryList> categoryList;
  bool success;

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      CategoryDetailsModel(
        categoryList: List<CategoryList>.from(
            json["category"].map((x) => CategoryList.fromJson(x))),
        success: json["success"],
      );
}

class CategoryList {
  CategoryList({
    required this.id,
    required this.name,
    required this.price,
    required this.conveyance,
    required this.labourPrice,
    required this.labourConveyance,
    required this.imageName,
    required this.imagePath,
    this.extra1,
    this.extra2,
    this.extra3,
    this.extra4,
    this.extra5,
    this.extra6,
    required this.isActive,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String price;
  String conveyance;
  String labourPrice;
  String labourConveyance;
  String imageName;
  String imagePath;
  dynamic extra1;
  dynamic extra2;
  dynamic extra3;
  dynamic extra4;
  dynamic extra5;
  dynamic extra6;
  String isActive;
  int isDelete;
  DateTime createdAt;
  DateTime? updatedAt;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        conveyance: json["conveyance"],
        labourPrice: json["labour_price"],
        labourConveyance: json["labour_conveyance"],
        imageName: "https://fgproduction.saamaancart.com/images/category/" +
            json["image_name"],
        imagePath: json["image_path"],
        extra1: json["extra1"],
        extra2: json["extra2"],
        extra3: json["extra3"],
        extra4: json["extra4"],
        extra5: json["extra5"],
        extra6: json["extra6"],
        isActive: json["is_active"],
        isDelete: json["is_delete"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
