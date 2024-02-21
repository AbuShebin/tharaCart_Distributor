import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/provider/firebase_provider.dart';
import 'package:thara_distributor/feature/cart/controller/cartController.dart';
import 'package:thara_distributor/core/common/util.dart';
import 'package:thara_distributor/feature/cart/screens/cartItemsWidget.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/feature/login/repository/login_repository.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/orderModel.dart';
import 'package:thara_distributor/model/stockModel.dart';
import '../../../main.dart';
import '../../../model/superMarketModel.dart';

final dropdownNameProvider=StateProvider<String?>((ref) => "");
final dropdownIdProvider=StateProvider<String?>((ref) => "");
final cartEmptyCheckerProvider=StateProvider((ref) => false);

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  int indx=0;
  String? _selectedSuperMarket;
  List<SuperMarketModel>?_superMarkets=[];
  String? selectedsuperMarketId;
   Map<String,dynamic> items={};
  //  double grandTotalPrice=0;
   int totalQuantity=0;

  placeOrder(){
    ref.read(cartControllerProvider).placeOrder(quantity: distributorModel!.bag[indx].quantity,context: context, indx: indx, superMarket: _selectedSuperMarket??'',grandTotal: ref.read(totalPriceProvider),totalQuantity: totalQuantity);
        ref.read(totalPriceProvider.notifier).update((state) => 0);

  }

  getSuperMarkets()async{

    Map superMap={};
    List<SuperMarketModel>? superMarkets=await  ref.read(orderControllerProvider).getSuperMarkets();
    _superMarkets=superMarkets;

    setState(() {});
  }

  getProducts(){
    ref.read(loginRepositoryProvider).getUser(ref: ref);
  }

  grandTotal(){
    // grandTotalPrice=0;
    // double _grandTotal=0;
    totalQuantity=0;
    ref.read(loginControllerProvider.notifier).getUser(ref: ref);
    
    ref.watch(totalPriceProvider.notifier).update((state) => 0);

    for(int i=0; i<distributorModel!.bag.length; i++){
      print("aaaaaaaaaaa");
      print(ref.watch(totalPriceProvider));
      // totalQuantity=totalQuantity+distributorModel!.bag[i]['quantity'];
      totalQuantity = totalQuantity + distributorModel!.bag[i].quantity;

      ref.watch(totalPriceProvider.notifier).update((state) =>  ref.watch(totalPriceProvider)+( distributorModel!.bag[i].mrp* distributorModel!.bag[i].quantity));
      
      print(  ref.watch(totalPriceProvider));

    }
    
setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
 
    getProducts();
    getSuperMarkets();
Future.delayed(Duration(milliseconds: 200),() {
  grandTotal();
},) ;
//  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// grandTotal();
//  });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // ref.read(totalPriceProvider.notifier).update((state) => 0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice=ref.watch(totalPriceProvider);
    print("000000000000000000000000");
    print(items);
    return Scaffold(
      appBar: AppBar(),
      body
     : ref.watch(cartEmptyCheckerProvider)==true?Center(child: Text("cart is Empty")):
          SingleChildScrollView(
        child: Column(
          children: [
            Consumer(builder: 
            (context, ref, child) {
              return 
            ref.watch(getBagStreamrovider).when(data: (data) {
              return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                              indx=index;
                            return CartItemsWidget(index: index,data: data);
                        },
                         itemCount: data.bag.length ,
                      );
            }, error: (error, stackTrace) {
              return Text(error.toString());
            }, loading: () {
              return LinearProgressIndicator();
            },);
            
            },),
            SizedBox(height: 50,),
           Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListTile(
                    tileColor: Colors.grey[200],
                    title:  Text('Address : ${distributorModel!.address.city }, ${distributorModel!.address.district}, \n ${distributorModel!.address.state} \n ${distributorModel!.address.pinCode}'),
                  ),
                ),
    
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Total Price : '),
                Text(ref.watch(totalPriceProvider).toString()),
                SizedBox(width: 30,)
              ],
            ),
            SizedBox(height: 25,),

            DropdownButton(
              hint: Text('Please choose a supermarket'), // Not necessary for Option 1
              // value: ref.watch(dropdownNameProvider),
                            value: _selectedSuperMarket,
              onChanged: (newValue) {
                // ref.read(dropdownNameProvider.notifier).update((state) => newValue);
                // ref.read(dropdownIdProvider.notifier).update((state) => items[newValue]);
                _selectedSuperMarket=newValue;
                print("sssssssssssssssssssssssssssssss");
                print(newValue);
                print(items[newValue]);
                setState(() {});
              },

              items: _superMarkets!.map((superMarket) {
                // selectedsuperMarketId=superMarket.name+superMarket.address.city;

                return DropdownMenuItem(
                  child:  Text("${superMarket.name} ${superMarket.address.city}"),
                  // value: superMarket.name+superMarket.address.city,
                  value: superMarket.name+superMarket.address.city,
                );
              }).toList(),
            ),
            SizedBox(height: 50,),

            SizedBox(
              width: w,
              child: ElevatedButton(
                
                onPressed: () {
                if(_selectedSuperMarket==''||_selectedSuperMarket==null){
                  showSnackBar(context: context, text: 'select SuperMarket');
                  }
                  else{
              placeOrder();
                }
              }, child: Text('place order')),
            )
          ],
        ),
      ),
    );
  }
}