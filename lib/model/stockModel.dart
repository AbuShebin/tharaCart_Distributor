import 'package:cloud_firestore/cloud_firestore.dart';

StockModel? stockModel;
class StockModel{
  final String id;
  final double purchaseRate;
  final String wareHouseId;
  final String productId;
  final String productName;
  final String batchName;
  final String batchId;
  final int inTransit;
  final int quantity;
  final int damage;
  final int discount;
  final int shortage;
  final double mrp;
  final int status;
  final bool delete;
  final DocumentReference? reference;
  final DateTime createdTime;
  final DateTime lastDate;
  final List<String> search;
  final List<String> image;

//<editor-fold desc="Data Methods">
  const StockModel({
    required this.id,
    required this.wareHouseId,
    required this.productId,
    required this.status,
    required this.delete,
    this.reference,
    required this.createdTime,
    required this.search,
    required this.image,
    required this.batchId,
    required this.productName,
    required this.batchName,
    required this.purchaseRate,
    required this.mrp,
    required this.quantity,
    required this.shortage,
    required this.damage,
    required this.discount,
    required this.inTransit,
    required this.lastDate
  });

  StockModel copyWith({
    String? id,
    double? purchaseRate,
    String? wareHouseId,
    String? productId,
    String? productName,
    String? batchName,
    String? batchId,
    int? inTransit,
    int? quantity,
    int? damage,
    int? discount,
    int? shortage,
    double? mrp,
    int? status,
    bool? delete,
    DocumentReference? reference,
    DateTime? createdTime,
    DateTime? lastDate,
    List<String>? search,
    List<String>? image,
  }) {
    return StockModel(
      productName: productName?? this.productName,
      batchName: batchName?? this.batchName,
      purchaseRate: purchaseRate ?? this.purchaseRate,
      batchId: batchId ?? this.batchId,
      wareHouseId: wareHouseId ?? this.wareHouseId,
      quantity: quantity ?? this.quantity,
      productId: productId ?? this.productId,
      mrp: mrp ?? this.mrp,
      damage: damage ?? this.damage,
      discount: discount ?? this.discount,
      inTransit: inTransit ?? this.inTransit,
      lastDate: lastDate ?? this.lastDate,
      shortage: shortage ?? this.shortage,
      id: id ?? this.id,
      status: status ?? this.status,
      delete: delete ?? this.delete,
      reference: reference ?? this.reference,
      createdTime: createdTime ?? this.createdTime,
      search: search ?? this.search,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName':productName,
      'batchName':batchName,
      'purchaseRate':purchaseRate,
      'batchId':batchId,
      'quantity':quantity,
      'productId':productId,
      'mrp':mrp,
      'damage':damage,
      'discount':discount,
      'inTransit':inTransit,
      'lastDate':lastDate,
      'shortage':shortage,
      'wareHouseId': wareHouseId,
      'status': status,
      'delete': delete,
      'reference': reference,
      'createdTime': createdTime,
      'search': search,
      'image': image,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      id: map['id'] as String,
      wareHouseId: map['wareHouseId']??"",
      shortage: map["shortage"]??0,
      discount: map["discount"]??0,
      lastDate: map['lastDate'].toDate(),
      inTransit: map["inTransit"]??0,
      damage: map["damage"]??0,
      mrp: double.tryParse(map["mrp"].toString())??0.0,
      productId: map["productId"]??"",
      quantity: map["quantity"]??0,
      batchId: map["batchId"]??"",
      purchaseRate: double.tryParse(map["purchaseRate"].toString())??0.0,
      productName:map["productName"]??"",
      batchName:map["batchName"]??"",
      status: map['status'] as int,
      delete: map['delete'] as bool,
      reference: map['reference'] as DocumentReference,
      createdTime: map['createdTime'].toDate(),
      search: List<String>.from((map['search']),),
      image: List<String>.from((map['image']),),
    );
  }

//</editor-fold>
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:thara_distributor/model/bagModel.dart';

// StockModel? stockModel;
// class StockModel{
//   final String id;
//    List<BagModel> bag;
//   final String supplierId;
//   final String paymentMode;
//   final DateTime purchaseDate;
//   final String invoice1;
//   final String invoice2;
//   final String wareHouseId;
//   final double tax;
//   final int status;
//   final bool delete;
//   final DocumentReference? reference;
//   final DateTime createdTime;
//   final List<String> search;
//   final List<String> image;

// //<editor-fold desc="Data Methods">
//    StockModel({
//     required this.id,
//     required this.invoice1,
//     required this.invoice2,
//     required this.tax,
//     required this.bag,
//     required this.supplierId,
//     required this.wareHouseId,
//     required this.paymentMode,
//     required this.purchaseDate,
//     required this.status,
//     required this.delete,
//     this.reference,
//     required this.createdTime,
//     required this.search,
//     required this.image,
//   });

//   StockModel copyWith({
//     String? id,
//     List<BagModel>? bag,
//     String? supplierId,
//     String? paymentMode,
//     String? invoice1,
//     String? invoice2,
//     String? wareHouseId,
//     double? tax,
//     DateTime? purchaseDate,
//     int? status,
//     bool? delete,
//     DocumentReference? reference,
//     DateTime? createdTime,
//     List<String>? search,
//     List<String>? image,
//   }) {
//     return StockModel(
//       invoice1: invoice1 ?? this.invoice1,
//       id: id ?? this.id,
//       bag: bag ??this.bag,
//       supplierId:supplierId?? this.supplierId ,
//       wareHouseId:wareHouseId?? this.wareHouseId ,
//       paymentMode:paymentMode?? this.paymentMode,
//       purchaseDate:purchaseDate?? this.purchaseDate,
//       invoice2: invoice2 ?? this.invoice2,
//       tax: tax?? this.tax,
//       status: status ?? this.status,
//       delete: delete ?? this.delete,
//       reference: reference ?? this.reference,
//       createdTime: createdTime ?? this.createdTime,
//       search: search ?? this.search,
//       image: image ?? this.image,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'bag': List.generate(bag.length, (index) =>bag[index].toJson()),
//       'distributorId': supplierId,
//       'wareHouseId': wareHouseId,
//       'paymentMode': paymentMode,
//       'purchaseDate': purchaseDate,
//       'invoice2': invoice2,
//       'tax':tax,
//       'status': status,
//       'delete': delete,
//       'reference': reference,
//       'createdTime': createdTime,
//       'search': search,
//       'image': image,
//       "invoice1":invoice1
//     };
//   }

//   factory StockModel.fromMap(Map<String, dynamic> map) {
//     return StockModel(
//       id: map['id'] as String,
//       bag:List.generate(map['bag'].length, (index) =>BagModel.fromMap(map['bag'][index])),
//       supplierId: map['distributorId']??"",
//       wareHouseId: map['wareHouseId']??"",
//       tax: double.tryParse(map['tax'].toString())??0,
//       invoice1: map['invoice1']??"",
//       invoice2: map['invoice2']??"",
//       purchaseDate: map['purchaseDate'].toDate(),
//       paymentMode: map['paymentMode']??"",
//       status: map['status'] as int,
//       delete: map['delete'] as bool,
//       reference: map['reference'] as DocumentReference,
//       createdTime: map['createdTime'].toDate(),
//       search: List<String>.from((map['search']),),
//       image: List<String>.from((map['image']),),
//     );
//   }
// }
