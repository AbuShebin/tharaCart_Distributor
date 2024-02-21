import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/common/util.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/feature/cart/screens/cartPage.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/stockModel.dart';
import 'package:thara_distributor/model/superMarketModel.dart';

class OrderPage extends ConsumerStatefulWidget {
  final ProductModel productdata;
  final String wareHouseId;
  StockModel stockModel;
  int index;
   OrderPage({required this.productdata,required this.wareHouseId,required this.stockModel,required this.index});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
   int quantity=0;
     
     List<SuperMarketModel>?_superMarkets=[];
     List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String? _selectedSuperMarket; //

   getSuperMarkets()async{
    List<SuperMarketModel>? superMarkets=await  ref.read(orderControllerProvider).getSuperMarkets();
    _superMarkets=superMarkets;
    print(_superMarkets![0].name);
    setState(() {
      
    });
    
     }

     @override
  void initState() {
  getSuperMarkets();
  print('index in order page init :${widget.index}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("product Name : ${widget.productdata.productName}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
             DropdownButton(
            hint: Text('Please choose a supermarket'), // Not necessary for Option 1
            value: _selectedSuperMarket,
            onChanged: (newValue) {
              setState(() {
                _selectedSuperMarket = newValue.toString();
              });
            },
            items: _superMarkets!.map((superMarket) {
              return DropdownMenuItem(
                child:  Text(superMarket.name),
                value: superMarket.name,
              );
            }).toList(),
          ),
        
SizedBox(
  height: 100,
),

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
  ),SizedBox(height: 100,),
  ElevatedButton(onPressed: () {
    // if(_selectedSuperMarket==''||_selectedSuperMarket==null){
    //   showSnackBar(context: context, text: 'select SuperMarket');
    // }else if(quantity==0){
    //    showSnackBar(context: context, text: 'enter quantity');
    // } else{
  //  ref.read(orderControllerProvider).addToKart(context: context,productId: widget.stockModel.bag[widget.index].productId);
    //  ref.read(orderControllerProvider).addOrder(productName: widget.productdata.productName,quantity: quantity,superMarket: _selectedSuperMarket!,wareHouseId: widget.wareHouseId,productId: widget.productdata.id,index: widget.index,stockId: widget.stockModel.id,context: context);
      showSnackBar(context: context, text: 'order Placed');
    // }
  }, child: Text('place order'))
            ],
          ),
        ),
      ),
    );
  }
}