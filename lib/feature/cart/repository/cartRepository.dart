import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/constant/firebase_constants.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/feature/login/repository/login_repository.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/salesManagerModel.dart';
import '../../../model/orderModel.dart';
import '../../../model/stockModel.dart';
import '../../../core/common/util.dart';
import '../../../core/provider/firebase_provider.dart';

final cartRepositoryProvider = Provider(
  (ref) => CartRepository(firestore: ref.read(firestoreProvider)),
);

class CartRepository {
  final FirebaseFirestore _firestore;

  CartRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  getProducts({required int index}) {
    return _firestore
        .collection(FirebaseConstants.distributor)
        .where('id', isEqualTo: distributorModel!.bag[index])
        .get();
  }

  // placeOrder({
  //     required BuildContext context,
  //     required int indx,
  //     required String superMarket,
  //     required int quantity,
  //     required double grandTotal,
  //     required int totalQuantitry,
  //     }) async {
  //       print(grandTotal);
  //       print(totalQuantitry);
  //       print('===========------------++++++++++++++++++++++');

  //   ordersModel = OrdersModel(
  //     returnReason: '',
  //     cGst: 0,
  //     iGst: 0,
  //     sGst: 0,
  //     excludeGst: 0,
  //     totalPrice: 0,
  //     rejectReason: '',
  //     createdDate: DateTime.now(),
  //     grandTotal: grandTotal,
  //     gst: '',
  //     transit: 0,
  //       delete: false,
  //       bag: distributorModel!.bag,
  //       paymentMode: '',
  //       purchaseDate: DateTime.now(),
  //       invoice1: '',
  //       invoice2: '',
  //       wareHouseId: salesManagerModel?.wareHouseId ?? '',
  //       tax: 0.0,
  //       status: 0,
  //       search: [],
  //       supermarketId: '',
  //       driver: '',
  //       distributorId: distributorModel!.id,
  //       totalQuantity: totalQuantitry,
  //       );

  //      final s=await FirebaseFirestore.instance.collection('settings').doc('custom').get();

  //      int docName=s['docId'];
  //      var e=docName++;
  //     //  FirebaseFirestore.instance.collection('orders').doc(e.toString()).set(ordersModel!.toMap());
  //     FirebaseFirestore.instance.collection('settings').doc('custom').update({
  //       "docId":e,
  //     });
  //   FirebaseFirestore.instance.collection('orders').doc(e.toString()).set(ordersModel!.toMap()).then((value) async {

  //     var val = await value.get();
      

  //     var orderData = ordersModel?.copyWith(reference: val.reference, id: val.id);
  //     val.reference.update(orderData!.toMap());

  //     distributorModel!.bag.clear();

  //     var distributorData = distributorModel!.copyWith(bag: distributorModel!.bag);

  //     _firestore.collection(FirebaseConstants.distributor).doc(currentUserId).update(distributorData.toJson()).then((value) =>  Navigator.of(context).pop());
     
  //   });
  //   showSnackBar(context: context, text: 'order Placed');
  // }

 placeOrder({
  required BuildContext context,
  required int indx,
  required String superMarket,
  required int quantity,
  required double grandTotal,
  required int totalQuantitry,
}) async {
  print(grandTotal);
  print(totalQuantitry);
  print('===========------------++++++++++++++++++++++');

  String orderId='tco';

  ordersModel = OrdersModel(
     returnReason: '',
      cGst: 0,
      iGst: 0,
      sGst: 0,
      excludeGst: 0,
      totalPrice: grandTotal,
      rejectReason: '',
      createdDate: DateTime.now(),
      grandTotal: grandTotal,
      gst: '',
      transit: 0,
        delete: false,
        bag: distributorModel!.bag,
        paymentMode: '',
        purchaseDate: DateTime.now(),
        invoice1: '',
        invoice2: '',
        wareHouseId: salesManagerModel?.wareHouseId ?? '',
        tax: 0.0,
        status: 0,
        search: [],
        supermarketId: '',
        driver: '',
        distributorId: distributorModel!.id,
        totalQuantity: totalQuantitry,
  );

  final settings = await FirebaseFirestore.instance.collection('settings').doc('settings').get();

  int docName =settings['orderId'];
  orderId=orderId+(docName+1).toString();
  orderId=orderId+( Timestamp.now().millisecondsSinceEpoch.toString());

  var orderIdsubString = orderId.substring(0,15);

  var e = docName+1 ;
  docName++;

  FirebaseFirestore.instance.collection('settings').doc('settings').update({
    "orderId": e,
  });     

  final orderDocument = FirebaseFirestore.instance.collection('orders').doc(orderIdsubString.toString());

  orderDocument.set(ordersModel!.toMap()).then((value) async {
    // Retrieve the document using the reference
    orderDocument.get().then((docSnapshot) {
      var orderData = ordersModel?.copyWith(reference: orderDocument, id: docSnapshot.id);
      orderDocument.update(orderData!.toMap());

      distributorModel!.bag.clear();
      var distributorData = distributorModel!.copyWith(bag: distributorModel!.bag);
      _firestore.collection(FirebaseConstants.distributor).doc(currentUserId).update(distributorData.toJson()).then((value) => Navigator.of(context).pop());
    });
  });

  showSnackBar(context: context, text: 'Order Placed');
}



  Stream<DistributorModel> getBagStream(){
   return _firestore.collection(FirebaseConstants.distributor).doc(distributorModel!.id).snapshots().map((event) =>  DistributorModel.fromMap(event.data()));
  }

  removeItemFrmCart({required int index, required BuildContext context,required WidgetRef ref}) {

    // ref.read(loginControllerProvider.notifier).getUser();

     List<OrderBagModel>? _bag;

    FirebaseFirestore.instance.collection(FirebaseConstants.distributor).doc(distributorModel!.id).get().then((value) {
      distributorModel = DistributorModel.fromMap(value.data()! );
     
    _bag = distributorModel!.bag;
    
  _bag!.removeAt(index);
    // distributorModel!.bag=_bag!;
    var data = distributorModel!.copyWith(bag: _bag);

    FirebaseFirestore.instance
        .collection(FirebaseConstants.distributor)
        .doc(currentUserId)
        .update(data.toJson())
        .then((value) {
          
          // distributorModel!.bag.clear();
             print(distributorModel!.bag);
             print('remve from kart');
             
        _bag!.clear();
        _bag=[];
    });

  }
  );
}

}