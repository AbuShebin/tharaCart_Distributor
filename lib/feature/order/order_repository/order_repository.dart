import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_launcher/utils/template.dart';
import 'package:thara_distributor/core/common/util.dart';
import 'package:thara_distributor/core/provider/firebase_provider.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/feature/login/repository/login_repository.dart';
import 'package:thara_distributor/model/bagModel.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/orderModel.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/stockModel.dart';
import 'package:thara_distributor/model/superMarketModel.dart';
import '../../../core/constant/firebase_constants.dart';

final bagList_orderHistoryProvider=StateProvider<List<Map<String, dynamic>>?>((ref) => null);
final ordersLength=StateProvider((ref) => 0);

final orderRepositoryProvider = Provider(
      (ref) => OrderRepository(firestore: ref.read(firestoreProvider)),
);

class OrderRepository{
 final FirebaseFirestore _firestore;
  OrderRepository({
    required FirebaseFirestore firestore,
  })  : _firestore = firestore;

  Future<List<SuperMarketModel>?> getSuperMarkets()async{

    List<SuperMarketModel>superMarkets=[];
   var data=await _firestore.collection(FirebaseConstants.superMarket).get();
   if(data.docs.isNotEmpty){
    for(var i in data.docs){
      superMarkets.add(SuperMarketModel.fromMap(i.data()));

    }
    return superMarkets ;
   }else{
    return null;
   }

  }

  addToKart({required String productId ,required BuildContext context,required ProductModel product,required int quantity,required DistributorModel distributorData ,required WidgetRef ref,required String batchName,required String batchId}){

  try{ 

    // ref.read(loginControllerProvider.notifier).getUser();
    FirebaseFirestore.instance.collection(FirebaseConstants.distributor).doc(distributorModel!.id).get().then((value) {
      distributorModel = DistributorModel.fromMap(value.data()! );

    List<OrderBagModel> ls=distributorModel!.bag;

    OrderBagModel data=OrderBagModel(productName: product.productName,mrp: product.mrp,productId: product.id,quantity: quantity,batchId: batchId,batchName: batchName);

    ls.add(data);
    distributorModel!.bag=ls;
    
      _firestore.collection(FirebaseConstants.distributor).doc(currentUserId).update(distributorModel!.toJson()).then((value) {
    print(distributorModel!.bag);
    print('added to kart repo');
      showSnackBar(context: context, text: '${product.productName} Added to cart');
      ls.clear();
      Navigator.of(context).pop();
      }
    );

    });
  } catch(e){
    showSnackBar(context: context, text: e.toString());
  }
}

 Stream<List<OrdersModel>> getOrders()  {
   var data= _firestore.collection(FirebaseConstants.orders).where('distributorId',isEqualTo: distributorModel!.id).snapshots().map((event) => event.docs.map((e) => OrdersModel.fromMap(e.data())).toList());
  
  return data;
  }

//   getOrders({required WidgetRef ref})async{
//     List<Map<String, dynamic>>? ls=[];
//    var data = await _firestore.collection(FirebaseConstants.orders).where('distributorId',isEqualTo: distributorModel!.id).get();
// if(data.docs.isNotEmpty){
//    for(var i in data.docs){
//     ls.add(i.data());
//      OrdersModel.fromMap(i.data());
//       print(ls);
//       print('--------------------');
//       print(ls[0]['bag'][0]['productName']);
//    }

//    }

//     ref.read(bagList_orderHistoryProvider.notifier).update((state) => ls);

//   return data;
//   }

cancleOrder({required String orderId,required BuildContext context}) {

   print(orderId);
   print('-----------------==================++++++++++++++++++');
   print(ordersModel!.id);
   // var ls=ordersModel!.bag[productindex];
   var data=ordersModel!.copyWith(status: 7);
   ordersModel!.reference!.update(data.toMap()).then((value) => showSnackBar(context: context, text: 'order cancelled succussfully'));
 }

 Stream<List<OrdersModel>> getCancelledOrder()  {
   var data= _firestore.collection(FirebaseConstants.orders).where('distributorId',isEqualTo: distributorModel!.id).where('status',isEqualTo: 7).snapshots().map((event) => event.docs.map((e) => OrdersModel.fromMap(e.data())).toList());
  
  return data;
  }

}