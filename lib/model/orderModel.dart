import 'package:cloud_firestore/cloud_firestore.dart';

OrdersModel? ordersModel;
class OrdersModel{
  String? id;
  List<OrderBagModel> bag;
  final String paymentMode;
  final DateTime purchaseDate;
  final DateTime createdDate;
  final String invoice1;
  final String invoice2;
  final String wareHouseId;
  final String gst;
  final double tax;
  final double iGst;
  final double sGst;
  final double cGst;
  final double grandTotal;
  final double totalPrice;
  final int status;
  final bool delete;
  DocumentReference? reference;
  final List<dynamic> search;
  final String supermarketId;
  final String driver;
  final String rejectReason;
  final String returnReason;
  final String distributorId;
  final int? transit;
  final int? totalQuantity;
  final double excludeGst;
  OrdersModel({
    this.id,
    required this.bag,
    required this.paymentMode,
    required this.purchaseDate,
    required this.invoice1,
    required this.invoice2,
    required this.wareHouseId,
    required this.tax,
    required this.status,
    required this.delete,
    this.reference,
    required this.search,
    required this.createdDate,
    required this.supermarketId,
    required this.driver,
    required this.distributorId,
    required this.gst,
    required this.rejectReason,
    required this.returnReason,
    required this.grandTotal,
    required this.totalQuantity,
    required this.transit,
    required this.cGst,
    required this.iGst,
    required this.totalPrice,
    required this.sGst,
    required this.excludeGst
  });
  OrdersModel copyWith({
    String? id,
    List<OrderBagModel>? bag,
    String? paymentMode,
    DateTime? purchaseDate,
    DateTime? createdDate,
    String? invoice1,
    String? invoice2,
    String? wareHouseId,
    String? gst,
    double? tax,
    double? grandTotal,
    double? totalPrice,
    int? status,
    int? transit,
    int? totalQuantity,
    bool? delete,
    DocumentReference? reference,
    DateTime? createdTime,
    List<dynamic>? search,
    String? supermarketId,
    String? distributorId,
    String? driver,
    String? rejectReason,
    String? returnReason,
    double? cGst,
    double? iGst,
    double? sGst,
    double? excludeGst,
  }) {
    return OrdersModel(
      id: id ?? this.id,
      bag: bag ?? this.bag,
      paymentMode: paymentMode ?? this.paymentMode,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      createdDate: createdDate ?? this.createdDate,
      invoice1: invoice1 ?? this.invoice1,
      invoice2: invoice2 ?? this.invoice2,
      wareHouseId: wareHouseId ?? this.wareHouseId,
      tax: tax ?? this.tax,
      gst: gst ?? this.gst,
      grandTotal: grandTotal ?? this.grandTotal,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      reference: reference ?? this.reference,
      search: search ?? this.search,
      // quantity: quantity ?? this.quantity,
      supermarketId: supermarketId ?? this.supermarketId,
      driver: driver??this.driver,
      delete: delete??this.delete,
      distributorId: distributorId??this.distributorId,
      transit: transit??this.transit,
      totalQuantity: totalQuantity??this.totalQuantity,
      rejectReason: rejectReason??this.rejectReason,
      returnReason: rejectReason??this.returnReason,
      cGst: cGst??this.cGst,
      sGst: sGst ??this.sGst,
      iGst: iGst ?? this.iGst,
      excludeGst: excludeGst??this.excludeGst,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id??'',
      'bag': List.generate(bag.length, (index) =>bag[index].toJson()),
      'paymentMode': paymentMode,
      'purchaseDate': purchaseDate,
      'createdDate': createdDate,
      'invoice1': invoice1,
      'invoice2': invoice2,
      'wareHouseId': wareHouseId,
      'tax': tax,
      'grandTotal': grandTotal,
      'totalPrice': totalPrice,
      'gst': gst,
      'status': status,
      'reference': reference??'',
      'search': search,
      'supermarketId': supermarketId,
      'driver':driver,
      'delete':delete,
      'distributorId':distributorId,
      'transit':transit,
      'totalQuantity':totalQuantity,
      'rejectReason':rejectReason,
      'returnReason':returnReason,
      "cGst":cGst,
      "iGst":iGst,
      "sGst":sGst,
      'excludeGst':excludeGst,
    };
  }
  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      id: map['id']??"",
      bag:List.generate(map['bag'].length, (index) =>OrderBagModel.fromMap(map['bag'][index])),
      paymentMode: map['paymentMode']??"",
      purchaseDate: map['purchaseDate'] .toDate(),
      createdDate: map['createdDate'] .toDate(),
      invoice1: map['invoice1']??"",
      invoice2: map['invoice2']??"",
      wareHouseId: map['wareHouseId']??"",
      tax:double.tryParse( map['tax'].toString())??0.0,
      totalQuantity: map['totalQuantity'] ??0,
      totalPrice: double.tryParse(map['totalPrice'].toString()) ??0,
      transit: map['transit'] ??0,
      gst: map['gst'] ??"",
      grandTotal:double.tryParse( map['grandTotal'].toString()) ??0,
      status: map['status'] as int,
      reference: map['reference'] as DocumentReference,
      search: map['search'] as List<dynamic>,
      supermarketId: map['supermarketId']??"",
      driver: map['driver']??"",
      delete: map['delete'] as bool,
      distributorId: map['distributorId']??"",
      rejectReason: map['rejectReason']??"",
      returnReason: map['returnReason']??"",
      iGst: double.tryParse(map['iGst'].toString())??0.0,
      sGst:double.tryParse( map["sGst"].toString())??0.0,
      cGst:double.tryParse(map["cGst"].toString())??0.0,
      excludeGst: double.tryParse(map['excludeGst'].toString())??0.0,
    );
  }
}

class OrderBagModel{
  final String productId;
  final double mrp;
  final int quantity;
  final String productName;
  final String batchName;
  final String batchId;

  OrderBagModel({
    required this.mrp,
    required this.productId,
    required this.quantity,
    required this.productName,
    required this.batchId,
    required this.batchName,
  });


  OrderBagModel copyWith({
    double? mrp,
    int? quantity,
    String? productId,
    String? productName,
    String? batchId,
    String? batchName,
  }) {
    return OrderBagModel(
      productId: productId ??this.productId,
      mrp: mrp??this.mrp,
      quantity: quantity??this.quantity,
      productName: productName??this.productName,
      batchName: batchName??this.batchName,
      batchId: batchId??this.batchId,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'mrp': mrp,
      'quantity': quantity,
      'productName': productName,
      'batchId': batchId,
      'batchName': batchName,
    };
  }

  factory OrderBagModel.fromMap(dynamic map) {
    return OrderBagModel(
      quantity:int.tryParse(map['quantity'].toString())??0,
      mrp: double.tryParse(map['mrp'].toString())??0.0,
      productId:map['productId'] ??"",
      productName:map['productName'] ??"",
      batchName:map['batchName'] ??"",
      batchId:map['batchId'] ??"",
    );
  }

}