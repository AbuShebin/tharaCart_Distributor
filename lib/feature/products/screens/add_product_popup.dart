import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/common/util.dart';
import 'package:thara_distributor/feature/cart/screens/cartItemsWidget.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/feature/products/controller/productController.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/stockModel.dart';

class AddProductPopup extends ConsumerStatefulWidget {
    final ProductModel data;
  final int index;
  const AddProductPopup({required this.data,required this.index});

  @override
  ConsumerState<AddProductPopup> createState() => _AddProductPopupState();
}

class _AddProductPopupState extends ConsumerState<AddProductPopup> {

  int quantity=0;
     int totalQuantity=0;
   List<StockModel>? _batches=[];
     String? _selectedBatch;

      getBatchStock()async{
      List<StockModel>? batches=await  ref.read(productControllerProvider).getBatchStock(productName: widget.data.productName);
      _batches=batches;
      print(_batches);
      print('batchesssssssss in product page init');
     }

     @override
  void initState() {
    // TODO: implement initState
    print('hiiiii welcome to the product popup');
    getBatchStock();
    super.initState();
  }
     
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text('select quantity'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("select quantity : "),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (quantity > 0) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(quantity.toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        quantity++;
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    DropdownButton(
                                      hint: Text('Please choose a batch'), 
                        value: _selectedBatch,
                                      onChanged: (newValue) {
                                        _selectedBatch=newValue.toString();
                                        setState(() {});
                                      },                    
                                      items: _batches!.map((stock) {
                        
                                        return DropdownMenuItem(
                                          child:  Text(stock.batchName),
                                          value: stock.batchId,
                                        );
                                      }).toList(),
                                    )
                     
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                           if(_selectedBatch!=''&&_selectedBatch!=null){
                             if (quantity > 0) {
                              print(_selectedBatch);
                              print('selectedd batchhhhh0000000009999999999');
                              ref.read(loginControllerProvider.notifier).getUser(ref: ref);
                              
                              ref.read(orderControllerProvider).addToKart(
                                distributordata: distributorModel!,
                                  context: context,
                                  product: widget.data,
                                  productId: widget.data.productCode,
                                  quanity: quantity,
                                  ref: ref,
                                  batchId: _selectedBatch??'',
                                  batchName: ''

                                  );
                                  
                                  quantity = 0;
             
                            ref.watch(totalPriceProvider.notifier).update((state) =>  ref.watch(totalPriceProvider)-(distributorModel!.bag[widget.index].mrp* distributorModel!.bag[widget.index].quantity));
        
                          } else {
                              showSnackBar(
                                  context: context, text: 'select quantity');
                            }
                            
                           }else{
                            Navigator.of(context).pop();
                            showSnackBar(context: context, text: 'out of stock');
                           }
                          },
                          child: Text('Add'))
                    ],
                  );
                },
              );
  }
}