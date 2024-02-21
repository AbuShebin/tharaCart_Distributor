import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/constant/colorContants.dart';
import 'package:thara_distributor/feature/homepage/controller/home_controller.dart';
import 'package:thara_distributor/feature/order/screens/orderPage.dart';
import 'package:thara_distributor/main.dart';
import 'package:thara_distributor/model/bagModel.dart';
import 'package:thara_distributor/model/productModel.dart';

class BagPage extends ConsumerStatefulWidget {
  final BagModel bagitem;
  final String wareHouseId;
  var stockModel;
  int index;
   BagPage({super.key, required this.bagitem,required this.wareHouseId,required this.stockModel,required this.index});

  @override
  ConsumerState<BagPage> createState() => _BagPageState();
}

class _BagPageState extends ConsumerState<BagPage> {
  
  getProduct()async{
    print("initStateWorkerd==============================");
var getProduct= ref.read(homeControllerProvider);
productModel=await getProduct.getProduct(widget.bagitem.productId);
  print(widget.bagitem.productId);
  print("product name in bagpage init: ${productModel!.productName}");
  setState(() {});
  
  }

  @override
  void initState() {
    
getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel?.productName??'product Name'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorPallete().kHomePageTileColor,
              ),
              height: h * 0.250,
              width: w * 0.9,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "product Name : ${productModel?.productName??'product Name'}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "damage : ${widget.bagitem.damage.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "dispatch : ${widget.bagitem.dispatch.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "mrp : ${widget.bagitem.mrp.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "quantity : ${widget.bagitem.quantity.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "shortage : ${widget.bagitem.shortage.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){

                      return OrderPage(productdata: productModel!,wareHouseId: widget.wareHouseId,stockModel: widget.stockModel,index: widget.index,);

                    },
                    ),
                    );
                  }, child: Text('order now'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
