import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/feature/homepage/controller/home_controller.dart';
import 'package:thara_distributor/feature/homepage/screen/home/stock/stockListWidget.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/model/bagModel.dart';
import 'package:thara_distributor/model/salesManagerModel.dart';
import 'package:thara_distributor/model/stockModel.dart';

class StockList extends ConsumerStatefulWidget {
   StockList({Key? key}) : super(key: key);

  @override
  ConsumerState<StockList> createState() => _StockListState();
}

class _StockListState extends ConsumerState<StockList> {



  @override
  void initState() {
    // getDistributor();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("stock List"),),
    body: 
     ref.watch(getStockProvider(salesManagerModel?.wareHouseId??'')).when(data: (data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,), 
      itemBuilder: (context, index) {
        stockModel=data[index];
        // bagModel=data[index].bag[index];
          return Padding(
          padding: const EdgeInsets.only(left:5.0,right: 5),
          child: Consumer(
            builder: (context, ref, child) {
             
            return stockListWidget(data: data[index],index: index,);
            }
          ));
        },
         itemCount: data.length,);
        
      },error: (error, stackTrace) {
          print(error);
                return Text(error.toString());
              },
              loading: () => LinearProgressIndicator())
    );
  }
}
