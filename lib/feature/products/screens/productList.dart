import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/common/globalWidgets/cartFloatingButton.dart';
import 'package:thara_distributor/feature/homepage/controller/home_controller.dart';
import 'package:thara_distributor/feature/homepage/screen/home/stock/stockListWidget.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/feature/products/controller/productController.dart';
import 'package:thara_distributor/feature/products/screens/productListWidget.dart';
import 'package:thara_distributor/model/bagModel.dart';
import 'package:thara_distributor/model/salesManagerModel.dart';
import 'package:thara_distributor/model/stockModel.dart';

final searchProvider=StateProvider<String>((ref) => '');

class ProductList extends ConsumerStatefulWidget {
   ProductList({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductList> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList> {

String? searchString;


  @override
  void initState() {
    // getDistributor();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final search=ref.watch(searchProvider);
    return Scaffold(
      
      appBar: AppBar(title: Text("Productuct List"),),

    body: 
    SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) async{
                ref.read(searchProvider.notifier).update((state) => value);  
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search products',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 10)
                )
              ),
            ),
          ),
       ref.watch(productStreamProvider(search)).when(data: (data) {
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,), itemBuilder: (context, index) {
         
            return Padding(
            padding: const EdgeInsets.only(left:5.0,right: 5),
            child: Consumer(
              builder: (context, ref, child) {
               
              return ProductListWidget(data: data[index],index: index,);
              
              }
            ));
          },
           itemCount: data.length,);
          
        },error: (error, stackTrace) {
            print(error);
                  return Text(error.toString());
                },
                loading: () => LinearProgressIndicator()),
       
        ],
      ),
    ),
            floatingActionButton: CartFloatingActionButton(),
    );
  }
}