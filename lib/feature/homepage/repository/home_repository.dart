import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/salesManagerModel.dart';
import 'package:thara_distributor/model/stockModel.dart';
import '../../../core/constant/firebase_constants.dart';
import '../../../model/distributor_model.dart';
import '../../../core/provider/firebase_provider.dart';

final wareHouseidProvider=StateProvider<String?>((ref) => null);

final homeRepositoryProvider = Provider(     
      (ref) => HomeRepository(firestore: ref.read(firestoreProvider)),
);

class HomeRepository {
  final FirebaseFirestore _firestore;
  HomeRepository({
    required FirebaseFirestore firestore,
  })  : _firestore = firestore;

  
  getsalesman({required String salesManId,required WidgetRef ref})async{
     var _data =await _firestore.collection(FirebaseConstants.salesManager).where('id',isEqualTo: salesManId).get();
     if(_data.docs.isNotEmpty){
     salesManagerModel= SalesManagerModel.fromMap(_data.docs.first);
      ref.read(wareHouseidProvider.notifier).update((state) =>state= salesManagerModel!.wareHouseId);
      print(salesManagerModel!.wareHouseId);
      print('=======================wareHouse ID in home repo');
     }

  }

  Stream<DistributorModel> getDistributor(String id){
    return   _firestore.collection(FirebaseConstants.distributor).doc(id).snapshots().map((event) =>DistributorModel.fromMap(event.data()));
  }

  

  getWareHOuseId({required String id}) async {
  var data=await _firestore.collection(FirebaseConstants.stock).where('distributorId',isEqualTo: id).get();
  return  data.docs.first.get('wareHouseId');
  }

  Stream<List<StockModel>> getStockStram({required String wareHOuseId}){
    print("=============================");
    print(wareHOuseId);
    print("id formmmmmmmmmmmmmmmmmmmmm");
    var _data=  _firestore.collection(FirebaseConstants.stock).where('wareHouseId',isEqualTo:wareHOuseId)
    .snapshots().map((event) =>event.docs.map((e) => StockModel.fromMap(e.data())).toList());
    
    return _data;
    
  }
  
  getProduct(String productId)async{
    
  var data=await  _firestore.collection('products').where('id',isEqualTo: productId).get();
  print(productId);
  print("product id in repository $productId");

  if(data.docs.isNotEmpty){
    var productData= ProductModel.fromMap(data.docs.first.data());

    print("prouductName in repo: ${productData.productName}");
    return productData;
  }else{
    return null;
  }

  }

  getOrdersCount() async {
   var data =await _firestore.collection(FirebaseConstants.orders).where('distributorId',isEqualTo: distributorModel!.id).get();

   return  data.docs.length;

  }

}