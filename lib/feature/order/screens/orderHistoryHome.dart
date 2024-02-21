import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thara_distributor/feature/order/screens/cancelledOrders.dart';
import 'package:thara_distributor/feature/order/screens/orderHistory.dart';

class OrderHistoryHome extends StatelessWidget {
  const OrderHistoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'All orders',
              ),
           Tab(
                text: 'cancelled orders',
              ),
          ]),
        ),
        body: TabBarView(children: [
          OrderHistory(),
          CancelledOrders()
        ]),
      ),
    );
  }
}