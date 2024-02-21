import 'package:cloud_firestore/cloud_firestore.dart';

ProductModel? productModel;
class ProductModel{
  final String id;
  final String categoryId;
  final String brandId;
  final String productName;
  final String description;
  final double weight;
  final double tax;
  final String skuCode;
  final String productCode;
  final String hsnCode;
  final int status;
  final bool delete;
  final DocumentReference? reference;
  final DateTime createdTime;
  final List<String> search;
  final List<String> image;
  final double mrp;

//<editor-fold desc="Data Methods">
  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.brandId,
    required this.productName,
    required this.description,
    required this.weight,
    required this.tax,
    required this.skuCode,
    required this.productCode,
    required this.hsnCode,
    required this.status,
    required this.delete,
    this.reference,
    required this.createdTime,
    required this.search,
    required this.image,
    required this.mrp,
  });

  ProductModel copyWith({
    String? id,
    String? categoryId,
    String? brandId,
    String? productName,
    String? description,
    double? weight,
    double? tax,
    String? skuCode,
    String? productCode,
    String? hsnCode,
    int? status,
    bool? delete,
    DocumentReference? reference,
    DateTime? createdTime,
    List<String>? search,
    List<String>? image,
    double? mrp,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      weight: weight ?? this.weight,
      tax: tax ?? this.tax,
      skuCode: skuCode ?? this.skuCode,
      productCode: productCode ?? this.productCode,
      hsnCode: hsnCode ?? this.hsnCode,
      status: status ?? this.status,
      delete: delete ?? this.delete,
      reference: reference ?? this.reference,
      createdTime: createdTime ?? this.createdTime,
      search: search ?? this.search,
      image: image ?? this.image,
      mrp: mrp?? this.mrp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'brandId': brandId,
      'productName': productName,
      'description': description,
      'weight': weight,
      'tax': tax,
      'skuCode': skuCode,
      'productCode': productCode,
      'hsnCode': hsnCode,
      'status': status,
      'delete': delete,
      'reference': reference,
      'createdTime': createdTime,
      'search': search,
      'image': image,
      'mrp': mrp,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      categoryId: map['categoryId'] ,
      brandId: map['brandId'] ,
      productName: map['productName'] as String,
      description: map['description']??"",
      weight:  double.tryParse(map['weight'].toString())??0.0,
      tax:  double.tryParse(map['tax'].toString())??0.0,
      skuCode: map['skuCode']??"",
      productCode: map['productCode']??"",
      hsnCode: map['hsnCode']??"",
      status: map['status'] as int,
      delete: map['delete'] as bool,
      reference: map['reference'] as DocumentReference,
      createdTime: map['createdTime'].toDate(),
      search: List<String>.from((map['search']),),
      image: List<String>.from((map['image']),),
      mrp: double.tryParse(map['mrp'].toString())??0.0,
    );
  }

//</editor-fold>
}
