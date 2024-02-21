import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/feature/cart/repository/cartRepository.dart';
import 'package:thara_distributor/feature/homepage/repository/home_repository.dart';
import 'package:thara_distributor/feature/order/order_repository/order_repository.dart';
import 'package:thara_distributor/model/bagModel.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/orderModel.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/superMarketModel.dart';

final getOrdersProvider=StreamProvider<List<OrdersModel>>((ref) =>ref.read(orderControllerProvider).getOrders());
final getCancelledOrdersProvider=StreamProvider<List<OrdersModel>>((ref) =>ref.read(orderControllerProvider).getCancelledOrders());

final orderControllerProvider = Provider(
      (ref) => OrderController(
        orderRepository: ref.read(orderRepositoryProvider)
        ),
);


class OrderController{

    final OrderRepository _orderRepository;

 OrderController({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

 getSuperMarkets()async{
   var data=await  _orderRepository.getSuperMarkets();
   return data;
  }

  addToKart({required String productId, required BuildContext context,required ProductModel product,required int quanity,required DistributorModel distributordata,required WidgetRef ref,required String batchId,required String batchName}){
    _orderRepository.addToKart(productId: productId, context: context,product: product,quantity: quanity,distributorData: distributordata,ref: ref,batchId: batchId,batchName: batchName);
  }

Stream<List<OrdersModel> >getOrders()    {
   var data =  _orderRepository.getOrders();
   return  data;
  }

  Stream<List<OrdersModel> >getCancelledOrders()    {
   var data =  _orderRepository.getCancelledOrder();
   return  data;
  }

cancelOrder({required String orderId,required BuildContext context}){
  _orderRepository.cancleOrder(orderId: orderId, context: context);
}
}