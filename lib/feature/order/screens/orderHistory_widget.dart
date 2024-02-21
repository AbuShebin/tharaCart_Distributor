import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/model/orderModel.dart';

class OrderHistoryWidget extends ConsumerStatefulWidget {
 final OrdersModel data;
  const OrderHistoryWidget({required this.data});

  @override
  ConsumerState<OrderHistoryWidget> createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends ConsumerState<OrderHistoryWidget> {
  @override
  void initState() {
    ordersModel = widget.data;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              return  Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: ListTile(
                          tileColor: Colors.grey[200],
                          title:  Text('Product Name : ${widget.data.bag[index].productName??'No product Name'}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('quantity : ${widget.data.bag[index].quantity}'),
                              Text('mrp : ${widget.data.bag[index].mrp}')
                            ],
                          ),
                         trailing: Text(widget.data.status.toString()),
                        ),
                  
                      );
                
              },
            
            itemCount: widget.data.bag.length,
            ),
              ElevatedButton(onPressed: () {
                      ref.read(orderControllerProvider).cancelOrder(orderId: widget.data.id.toString(), context: context);
                    }, child: Text('cancel Order',style: TextStyle(color: Colors.red),)),
          ],
        ),
      ),
    );
  }
}