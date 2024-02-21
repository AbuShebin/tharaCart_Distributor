import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/feature/cart/repository/cartRepository.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:flutter/material.dart';

final cartControllerProvider = Provider(
      (ref) => CartController(cartRepository: ref.read(cartRepositoryProvider)),
);

final getBagStreamrovider=StreamProvider<DistributorModel>((ref) => ref.read(cartControllerProvider).getBagStream());



class CartController {

  final CartRepository _cartrepository;

  CartController({
    required CartRepository cartRepository,
  }) : _cartrepository = cartRepository;

// Stream<List<ProductModel>> getProduct({ String? productId}){
//  return _cartrepository.getProducts();
// }

  placeOrder({required BuildContext context,required int indx,required String superMarket,required int quantity,required double grandTotal,required int totalQuantity}){
    _cartrepository.placeOrder(context: context, indx: indx, superMarket: superMarket, quantity: quantity,grandTotal: grandTotal,totalQuantitry: totalQuantity);
  }

 Stream<DistributorModel> getBagStream(){
   return _cartrepository.getBagStream();
  }

  removeFrmCart({required int index,required BuildContext context,required WidgetRef ref}){
    return   _cartrepository.removeItemFrmCart(index: index, context: context,ref: ref);
  }

}