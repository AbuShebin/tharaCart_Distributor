import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/common/util.dart';
import 'package:thara_distributor/core/constant/colorContants.dart';
import 'package:thara_distributor/feature/cart/screens/cartItemsWidget.dart';
import 'package:thara_distributor/feature/homepage/screen/home/stock/attendance.dart';
import 'package:thara_distributor/feature/homepage/screen/home/bag/bagList.dart';
import 'package:thara_distributor/feature/homepage/screen/home/bag/bagPage.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/feature/products/controller/productController.dart';
import 'package:thara_distributor/feature/products/screens/add_product_popup.dart';
import 'package:thara_distributor/main.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/stockModel.dart';
import '../../login/controller/login_controller.dart';

class ProductListWidget extends ConsumerStatefulWidget {
  ProductListWidget({required this.data, required this.index});
  final ProductModel data;
  final int index;


  @override
  ConsumerState<ProductListWidget> createState() => _stockListWidgetState();
}

class _stockListWidgetState extends ConsumerState<ProductListWidget> {
  int quantity = 0;
   int totalQuantity=0;
   List<StockModel>? _batches=[];
     String? _selectedBatch;

    //  getBatchStock()async{
    //   List<StockModel>? batches=await  ref.read(productControllerProvider).getBatchStock(productName: widget.data.productName);
    //   _batches=batches;
    //   print(_batches);
    //   print('batchesssssssss in product page init');
    //  }

  @override
  void initState() {
    // quantity=0;
    // print("hi welcome");
    // getBatchStock();
    super.initState();
  }

  // @override
  // void dispose() {
  //   quantity=0;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
              onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AddProductPopup(data: widget.data,index: widget.index,);
            });
              },
              child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorPallete().kHomePageTileColor,
        ),
        height: h * 0.170,
        width: w * 0.450,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: 
               Center(
                 child: Text(
                  widget.data.productName,
                  
                  style: TextStyle(
                    color: ColorPallete().kHomePageTileTextColor,
                  ),
                  overflow: TextOverflow.fade,
                               ),
               ),
            ),
         
              ),
            );
  }
}
