import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thara_distributor/feature/cart/screens/cartPage.dart';

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple[500],
    
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CartPage();
        },));
    },
    child:Icon(Icons.shopping_cart,
        color: Colors.grey[300]),);
  }
}