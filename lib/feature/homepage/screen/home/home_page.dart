import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/common/globalWidgets/cartFloatingButton.dart';
import 'package:thara_distributor/core/constant/colorContants.dart';
import 'package:thara_distributor/feature/homepage/controller/home_controller.dart';
import 'package:thara_distributor/feature/homepage/repository/home_repository.dart';
import 'package:thara_distributor/feature/homepage/screen/home/stock/stockList.dart';
import 'package:thara_distributor/feature/login/controller/login_controller.dart';
import 'package:thara_distributor/feature/login/repository/login_repository.dart';
import 'package:thara_distributor/feature/cart/screens/cartPage.dart';
import 'package:thara_distributor/feature/order/screens/orderHistory.dart';
import 'package:thara_distributor/feature/order/screens/orderHistoryHome.dart';
import 'package:thara_distributor/feature/products/screens/productList.dart';
import 'package:thara_distributor/model/distributor_model.dart';
import 'package:thara_distributor/model/salesManagerModel.dart';
import 'package:thara_distributor/model/stockModel.dart';
import '../../../../main.dart';
import '../../../login/screen/splash_screen.dart';
import 'stock/attendance.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
ColorPallete colorPallete=ColorPallete();
String wareHouseId='no wareHOuseId';
int ordersCount=0;

//  getWareHOuseId()async{
//  wareHouseId=await  ref.read(homeControllerProvider).getWareHOuseId(id: salesManagerModel!.wareHouseId);
//  print("ware house id    --------$wareHouseId ");
// }





@override
  void initState() {
  // distributorModel=  ref.read(loginControllerProvider.notifier).getUserStream();
  //  getWareHOuseId();
   ref.read(homeControllerProvider).getSalesManager(salesManager: distributorModel?.salesManId??'',ref: ref);
   //gets the wareHouse id in salesManager..
  //  String wareHOuseId=ref .read(wareHouseidProvider.notifier).state.toString();
  print(ref .read(wareHouseidProvider.notifier).state.toString());
  print('ref .read(wareHouseidProvider.notifier).state.toString()');

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor:colorPallete.kHomePageTileTextColor,
        elevation: 0,
        centerTitle: true,
        title:  Text(
                    "Distributor",
                    style: TextStyle(color: colorPallete.kAppbarTextColor),
                  ),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CartPage();
            },));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        
        child: DrawerHeader(child: Text(salesManagerModel?.wareHouseId??'wareHouseId')),
      ),
      body:
      SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Padding(

                padding: const EdgeInsets.all(13.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryHome(),
                          ));
                  },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: colorPallete.kHomePageTileColor,),
                    height: height * 0.170,
                    width: width * w,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          color: colorPallete.kHomePageTileIconColor,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Center(
                          child: InkWell(onTap: () {
                            
                          },
                            child:  Text(
                             'Orders :',
                              style: TextStyle(color:colorPallete.kHomePageTileTextColor,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
              Padding(

                padding: const EdgeInsets.all(13.0),
                child: GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(),
                          ));
                  },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: colorPallete.kHomePageTileColor,),
                    height: height * 0.170,
                    width: width * w,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: colorPallete.kHomePageTileIconColor,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Center(
                          child: InkWell(onTap: () {
                  
                          },
                            child:  Text(
                              'Products : ',
                              style: TextStyle(color:colorPallete.kHomePageTileTextColor,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
            ],
          ),
        ),

      ),
      floatingActionButton: CartFloatingActionButton(),
    );
  }
}

