import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/constant/firebase_constants.dart';
import 'package:thara_distributor/core/provider/firebase_provider.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/salesManagerModel.dart';
import 'package:thara_distributor/model/stockModel.dart';

final productRepositoryProvider=Provider((ref) => ProductRepository(firestore: ref.read(firestoreProvider)));

class ProductRepository{
  final FirebaseFirestore _firestore;
  ProductRepository({required FirebaseFirestore firestore}):_firestore=firestore;

   CollectionReference get _products =>
      _firestore.collection(FirebaseConstants.products);

  Stream<List<ProductModel>> productStream({required String search}){
  var data=  _products.where('search',arrayContains: search .isEmpty  ? null : search.toUpperCase().trim() ).snapshots().map((event) => event.docs.map((e) => ProductModel.fromMap(e.data() as Map<String ,dynamic>)).toList());
  return  data;
  }

  Future<List<StockModel>?>getBatchStockR({required String productName})async{
    print(productName);
    print(salesManagerModel!.wareHouseId);
    List<StockModel> batchStock=[];
    var data=await _firestore.collection('stock').where('productName',isEqualTo: productName).where('wareHouseId',isEqualTo: salesManagerModel!.wareHouseId).get();
  for(var i in data.docs){
    batchStock.add(StockModel.fromMap(i.data()));
  }
  
   print(batchStock);
   print('object----------------+++++++++++++++++++++++');

  return batchStock;
  }


}