import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/salesManagerModel.dart';
import 'package:thara_distributor/model/stockModel.dart';
import '../../../model/distributor_model.dart';
import '../repository/home_repository.dart';

final getDistributorProvider = StreamProvider.family((ref,String id)=>ref.read(homeControllerProvider).getDistributor(id));
// final getOrdersCountProvider= StreamProvider((ref) => ref.read(homeControllerProvider).getOrdersCount());
final getStockProvider=StreamProvider.family(( ref,String wareHOuseId) => ref.read(homeControllerProvider).getStockStream(wareHOuseId: wareHOuseId));

final homeControllerProvider = Provider(
      (ref) => HomeController(homeRepository: ref.read(homeRepositoryProvider)),
);

class HomeController {

  final HomeRepository _homeRepository;

  HomeController({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

   getSalesManager({required String salesManager,required WidgetRef ref}){
  _homeRepository.getsalesman(salesManId: salesManager,ref: ref);
  }

  Stream<DistributorModel> getDistributor(String id){
    return _homeRepository.getDistributor(id);
  }

 String getWareHOuseId({required String id}){
    String wareHouseId= _homeRepository.getWareHOuseId(id: id);
    return wareHouseId;
  }

  Stream<List<StockModel>>getStockStream({required String wareHOuseId}){
    return _homeRepository.getStockStram(wareHOuseId: wareHOuseId);
  }

 getProduct(String productId){
   return  _homeRepository.getProduct(productId);
   
  }

  getOrdersCount() async {
  return  await _homeRepository.getOrdersCount();
  }

}