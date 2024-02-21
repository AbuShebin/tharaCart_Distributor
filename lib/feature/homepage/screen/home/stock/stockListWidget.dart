import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/constant/colorContants.dart';
import 'package:thara_distributor/feature/homepage/screen/home/stock/attendance.dart';
import 'package:thara_distributor/feature/homepage/screen/home/bag/bagList.dart';
import 'package:thara_distributor/feature/homepage/screen/home/bag/bagPage.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/main.dart';
import 'package:thara_distributor/model/stockModel.dart';

import '../../../../login/controller/login_controller.dart';

class stockListWidget extends ConsumerStatefulWidget {

   stockListWidget({required this.data,required this.index});
 final   StockModel data;
 final int index;

  @override
  ConsumerState<stockListWidget> createState() => _stockListWidgetState();
}

class _stockListWidgetState extends ConsumerState<stockListWidget> {
   int quantity=0;
   // getDistributor(){
   //   ref.watch(loginControllerProvider.notifier).getUser();
   // }

   @override
  void initState() {
    // getDistributor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GestureDetector(
        onTap: () {
         
          
          //  Navigator.push(context, MaterialPageRoute(builder: (context) {
          //                 return BagList(bagModel: widget. data.bag,
          //                 indx:widget. index,wareHouseId:widget. data.wareHouseId,stockModel:widget. data);
          //               },));
        },
        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: ColorPallete().kHomePageTileColor,),
                    height: h * 0.170,
                    width: w * 0.450,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        const SizedBox(width: 8.0),
                        Center(
                         
                            child:  Text(
                               'Stock number ${widget.index+1}',
                              style: TextStyle(color:ColorPallete().kHomePageTileTextColor,),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        
                      ],
                    ),
                  
              ),
      )
    );
  }
}