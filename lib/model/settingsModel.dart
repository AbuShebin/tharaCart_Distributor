class SettingsModel{
  final int adminId;
  final int managerId;
  final int wareHouseId;
  final int salesManagerId;
  final int accountsManagerId;
  final int merchandiserId;
  final int driverId;
  final int categoryId;
  final int brandId;
  final int productId;
  final int batchId;
  final int distributorId;
  final int supplierId;
  final int purchaseId;
  final int invoice2;
  final int supermarketId;
  final int stockId;
  SettingsModel({
    required this.adminId,
    required this.managerId,
    required this.wareHouseId,
    required this.salesManagerId,
    required this.accountsManagerId,
    required this.merchandiserId,
    required this.driverId,
    required this.categoryId,
    required this.brandId,
    required this.productId,
    required this.batchId,
    required this.distributorId,
    required this.supplierId,
    required this.purchaseId,
    required this.invoice2,
    required this.supermarketId,
    required this.stockId,
  });

  SettingsModel copyWith({
    int? adminId,
    int? managerId,
    int? wareHouseId,
    int? salesManagerId,
    int? accountsManagerId,
    int? merchandiserId,
    int? driverId,
    int? categoryId,
    int? brandId,
    int? productId,
    int? batchId,
    int? distributorId,
    int? supplierId,
    int? purchaseId,
    int? invoice2,
    int? supermarketId,
    int? stockId,
  }){
    return SettingsModel(
      adminId: adminId ?? this.adminId,
      managerId: managerId ?? this.managerId,
      wareHouseId: wareHouseId ?? this.wareHouseId,
      salesManagerId: salesManagerId ?? this.salesManagerId,
      accountsManagerId: accountsManagerId ?? this.accountsManagerId,
      merchandiserId: merchandiserId ?? this.merchandiserId,
      driverId: driverId ?? this.driverId,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      productId: productId ?? this.productId,
      batchId: batchId ?? this.batchId,
      distributorId: distributorId ?? this.distributorId,
      supplierId: supplierId ?? this.supplierId,
      purchaseId: purchaseId ?? this.purchaseId,
      invoice2: invoice2 ?? this.invoice2,
      supermarketId: supermarketId ?? this.supermarketId,
      stockId: stockId ?? this.stockId,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adminId': adminId,
      'managerId': managerId,
      'wareHouseId': wareHouseId,
      'salesManagerId': salesManagerId,
      'accountsManagerId': accountsManagerId,
      'merchandiserId': merchandiserId,
      'driverId': driverId,
      'categoryId': categoryId,
      'brandId': brandId,
      'productId': productId,
      'batchId': batchId,
      'distributorId': distributorId,
      'supplierId': supplierId,
      'purchaseId': purchaseId,
      'invoice2': invoice2,
      'supermarketId': supermarketId,
      'stockId': stockId,
    };
  }

  factory SettingsModel.fromMap(dynamic map) {
    return SettingsModel(
        adminId:map['adminId'] as int,
      managerId:map['managerId'] as int,
      wareHouseId:map['wareHouseId'] as int,
      salesManagerId:map['salesManagerId'] as int,
      accountsManagerId:map['accountsManagerId'] as int,
      merchandiserId:map['merchandiserId'] as int,
      driverId:map['driverId'] as int,
      categoryId:map['categoryId'] as int,
      brandId:map['brandId'] as int,
      productId:map['productId'] as int,
      batchId:map['batchId'] as int,
      distributorId:map['distributorId'] as int,
      supplierId:map['supplierId'] as int,
      purchaseId:map['purchaseId'] as int,
      invoice2:map['invoice2'] as int,
      supermarketId:map['supermarketId'] as int,
      stockId:map['stockId'] as int,
);
}

}