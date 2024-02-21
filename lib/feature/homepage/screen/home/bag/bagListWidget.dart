import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/common/util.dart';
import 'package:thara_distributor/core/constant/colorContants.dart';
import 'package:thara_distributor/feature/homepage/controller/home_controller.dart';
import 'package:thara_distributor/feature/homepage/screen/home/bag/bagList.dart';
import 'package:thara_distributor/feature/homepage/screen/home/bag/bagPage.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/main.dart';
import 'package:thara_distributor/model/bagModel.dart';
import 'package:thara_distributor/model/productModel.dart';
import '../../../../login/controller/login_controller.dart';

class BagListWidget extends ConsumerStatefulWidget {
  final BagModel bagListitem;
  final String wareHouseId;
  var stockModel;
  int index;
   BagListWidget({required this.bagListitem,required this.wareHouseId,required this.stockModel,required this.index});

  @override
  ConsumerState<BagListWidget> createState() => _BagListWidgetState();
}

class _BagListWidgetState extends ConsumerState<BagListWidget> {
  int quantity=0;

//     getProduct()async{
//     print("initStateWorkerd==============================");
// var getProduct= ref.read(homeControllerProvider);
// productModel=await getProduct.getProduct(widget.bagListitem.productId);
//   print(widget.bagListitem.productId);
//   print("product name in bagpage init: ${productModel!.productName}");
//   setState(() {});
//
//   }
//   getDistributor(){
//     ref.watch(loginControllerProvider.notifier).getUser();
//   }

    getProduct()async{
    print("initStateWorkerd==============================");
var getProduct= ref.read(homeControllerProvider);
productModel=await getProduct.getProduct(widget.bagListitem.productId);
  print(widget.bagListitem.productId);
  print("product name in bagpage init: ${productModel!.productName}");
  setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getProduct();
    // getDistributor();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          GestureDetector(
            onTap: () {
               showDialog(context: context, builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
               return  AlertDialog(
              title: Text('select quantity'),
              content: Row(children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("select quantity : "),
                    SizedBox(width: 10,),
                    IconButton(onPressed: (){
                      if(quantity>0){
                      setState(() {
              quantity--;
                      });
                      }
                    }, icon: Icon(Icons.remove,size: 30,),),
                     SizedBox(width: 10,),
                    Text(
                      quantity.toString()
                    ),
                     SizedBox(width: 10,),
                      SizedBox(width: 10,),
                    IconButton(onPressed: (){
                      setState(() {
                        quantity++;
                      });
                    }, icon: Icon(Icons.add,size: 30,),),
                  ],
                ),],),
                actions: [
                  ElevatedButton(onPressed: () {
                       if(quantity>0){
                        //  ref.read(orderControllerProvider).addToKart(context: context,bag: widget.bagListitem,productId: widget.bagListitem.productId,quanity: quantity);
                        //  ref.read(loginControllerProvider.notifier).getUser();
                       }else{
                         showSnackBar(context: context, text: 'select quantity');
                       }
                  }, child: Text('Add'))
                ],
                        );  
              },
              
            );
          },
          );
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //                 return BagPage(bagitem: widget.bagListitem,wareHouseId: widget.wareHouseId,stockModel: widget.stockModel,index: widget.index,);
              //               },));
            },
            child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                color: ColorPallete().kHomePageTileColor,),
                        height: h * 0.200,
                        width: w * 0.450,
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            const SizedBox(width: 8.0),
                            InkWell(onTap: () {},
                              child:  Text(
                                 widget.bagListitem.productId,
                                style: TextStyle(color:ColorPallete().kHomePageTileTextColor,),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                             Text(
                    "damage : ${widget.bagListitem.damage.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "dispatch : ${widget.bagListitem.dispatch.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "mrp : ${widget.bagListitem.mrp.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "quantity : ${widget.bagListitem.quantity.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                  Text(
                    "shortage : ${widget.bagListitem.shortage.toString()}",
                    style:
                        TextStyle(color: ColorPallete().kHomePageTileTextColor),
                  ),
                          ],
                        ),
                      
                  ),
          ),
        ],
      )
    );
  }
}