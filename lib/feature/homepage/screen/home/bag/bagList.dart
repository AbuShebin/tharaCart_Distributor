// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:thara_distributor/core/constant/colorContants.dart';
// import 'package:thara_distributor/feature/homepage/controller/home_controller.dart';
// import 'package:thara_distributor/feature/homepage/screen/home/stock/attendance.dart';
// import 'package:thara_distributor/feature/homepage/screen/home/stock/stockListWidget.dart';
// import 'package:thara_distributor/feature/homepage/screen/home/bag/bagListWidget.dart';
// import 'package:thara_distributor/feature/homepage/screen/home/bag/bagPage.dart';
// import 'package:thara_distributor/feature/login/controller/login_controller.dart';
// import 'package:thara_distributor/feature/login/repository/login_repository.dart';
// import 'package:thara_distributor/main.dart';
// import 'package:thara_distributor/model/bagModel.dart';
// import 'package:thara_distributor/model/productModel.dart';
// import 'package:thara_distributor/model/stockModel.dart';

// class BagList extends ConsumerStatefulWidget {
//   // final List<BagModel> bagModel;
//   var stockModel;
//   // final String wareHouseId;
//   // final int indx;
//   //  BagList({required this.bagModel,required this.indx,required this.wareHouseId,required this.stockModel});

//   @override
//   ConsumerState<BagList> createState() => _BagListState();
// }

// class _BagListState extends ConsumerState<BagList> {

//   getProduct()async{
//     print("initStateWorkerd==============================");
// var getProduct= ref.read(homeControllerProvider);
// productModel=await getProduct.getProduct(widget.bagModel[widget.indx].productId);
//   print(widget.bagModel[widget.indx].productId);
//   print("product name in bagList init: ${productModel!.productName}");
//   setState(() {});
  
//   }

//   @override
//   void initState() {
//     getProduct();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("BagLists"),),
//     body: 
//      GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,), 
//       itemBuilder: (context, index) {  
//           return Padding(
//           padding: const EdgeInsets.only(left:5.0,right: 5),
//           child: BagListWidget(bagListitem: widget.bagModel[index],wareHouseId: widget.wareHouseId,stockModel: widget.stockModel,index: index,));
//         },
//          itemCount: widget.bagModel.length,),
//     );
//   }
// }