import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thara_distributor/feature/order/order_controller/orderController.dart';
import 'package:thara_distributor/feature/order/screens/orderHistory_widget.dart';
import 'package:thara_distributor/model/orderModel.dart';

class OrderHistory extends ConsumerStatefulWidget {
  const OrderHistory({super.key});

  @override
  ConsumerState<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends ConsumerState<OrderHistory> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ref.watch(getOrdersProvider).when(data: (data) {
      return  ListView.builder(
      itemBuilder: (context, index) {
        ordersModel=data[index];
        return  Consumer(
          builder: (context, ref, child) {
            return    Padding(
            padding: const EdgeInsets.all(13.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return OrderHistoryWidget(data: data[index],);
                },));
              },
              child: ListTile(
                tileColor: Colors.grey[200],
                title:  Text('order id :${data[index].id}'),
                subtitle: Column(
                  children: [
                    Text('wareHouseId : ${data[index].wareHouseId.toString()}'),
                    Text('ordered Date : ${DateFormat('yyyy-MM-dd ').format(data[index].purchaseDate)}')
                  ],
                ),
               
                
               
              ),
            ),
                
          );
        
          },
        );
            
              },
              itemCount: data.length,
              );
             
      }, error: (error, stackTrace) {
       return Text(stackTrace.toString());
      }, loading: () {
        return LinearProgressIndicator();
      },),
         
    );
  }
}
