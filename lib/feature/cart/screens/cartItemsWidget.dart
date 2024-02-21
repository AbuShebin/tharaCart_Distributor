import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/common/util.dart';
import 'package:thara_distributor/core/constant/firebase_constants.dart';
import 'package:thara_distributor/feature/cart/controller/cartController.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/feature/login/repository/login_repository.dart';
import 'package:thara_distributor/main.dart';
import 'package:thara_distributor/model/distributor_model.dart';

final totalPriceProvider=StateProvider<double>((ref) => 0);

class CartItemsWidget extends ConsumerStatefulWidget {
  const CartItemsWidget({required this.index,required this.data});
  final int index;
  final DistributorModel data;

  @override
  ConsumerState<CartItemsWidget> createState() => _CartItemsWidgetState();
}

class _CartItemsWidgetState extends ConsumerState<CartItemsWidget> {

   getUser(){
    ref.read(loginControllerProvider.notifier).getUser(ref: ref);
    
   }

  @override
  void initState() {
    // TODO: implement initState
    // print(widget.data[widget.index].bag.length);
    // print('length=-----------------');
  }
  @override
  Widget build(BuildContext context) {
    DistributorModel distributorModel=widget.data;
    final totalPrice=ref.watch(totalPriceProvider);
    return  Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListTile(
                    tileColor: Colors.grey[200],
                    title:  Text('Product Name : ${widget.data.bag[widget.index].productName}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('quantity : ${widget.data.bag[widget.index].quantity}'),
                        Text('mrp : ${widget.data   .bag[widget.index].mrp}')
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                      if(mounted){
                        
                           ref.read(cartControllerProvider).removeFrmCart(index: widget.index, context: context,ref: ref);
                              ref.watch(totalPriceProvider.notifier).update((state) =>  ref.watch(totalPriceProvider)-(widget.data.bag[widget.index].mrp* widget.data.bag[widget.index].quantity));
                              getUser();
                              setState(() {});
                              
                          }
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,),
                  ),
            
                );
    
  }
}