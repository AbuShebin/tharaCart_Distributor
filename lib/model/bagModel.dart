BagModel? bagModel;
class BagModel{
  final String productId;
  final double mrp;
  final int quantity;
  final int shortage;
  final int dispatch;
  final int damage;
  final String batchId;
  final String batchName;
  final String productName;
  final int transit;
  final double purchaseRate;


  BagModel({
    required this.mrp,
    required this.damage,
    required this.shortage,
    required this.productId,
    required this.quantity,
    required this.dispatch,
    required this.purchaseRate,
    required this.batchId,
    required this.productName,
    required this.transit,
    required this.batchName
  });


  BagModel copyWith({
    double? mrp,
    double? purchaseRate,
    int? quantity,
    int? damage,
    int? dispatch,
    int? shortage,
    int? transit,
    String? productId,
    String? productName,
    String? batchId,
    String? batchName,
  }) {
    return BagModel(
      productId: productId ??this.productId,
      mrp: mrp??this.mrp,
      quantity: quantity??this.quantity,
      damage: damage??this.damage,
      dispatch: dispatch??this.dispatch,
      shortage: shortage??this.shortage,
      purchaseRate: purchaseRate??this.purchaseRate,
      batchId: batchId??this.batchId,
      productName: productName??this.productName,
      transit: transit??this.transit,
      batchName: batchName??this.batchName,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'mrp': mrp,
      'quantity': quantity,
      'shortage': shortage,
      'damage': damage,
      'dispatch': dispatch,
      'transit': transit,
      'purchaseRate': purchaseRate,
      'batchId': batchId,
      'productName': productName,
      'batchName': batchName,
    };
  }

  factory BagModel.fromMap(dynamic map) {
    return BagModel(
      quantity:map['quantity']??0,
      damage:map['damage']??0,
      dispatch:map['dispatch']??0,
      shortage:map['shortage']??0,
      // mrp: double.tryParse(map['mrp'].toString())??0.0,
      mrp: (map['mrp'] is int) ? map['mrp'].toDouble() : double.tryParse(map['mrp'].toString()) ?? 0.0,
      productId:map['productId'] ??"",
      productName:map['productName'] ??"",
  purchaseRate: (map['purchaseRate'] is int) ? map['purchaseRate'].toDouble() : (map['purchaseRate'] ?? 0.0),      batchId:map['batchId'] ??"",
      batchName:map['batchName'] ??"",
      transit:map['transit'] ??0,
);
}

}
