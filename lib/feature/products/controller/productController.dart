import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/provider/firebase_provider.dart';
import 'package:thara_distributor/feature/products/repository/productRepository.dart';
import 'package:thara_distributor/model/productModel.dart';
import 'package:thara_distributor/model/stockModel.dart';

// final productControllerProvider = Provider(
//   (ref) => ProductRepository(firestore: ref.read(firestoreProvider)),
// );

final productControllerProvider = Provider(
  (ref) => ProductController(productRepository: ref.read(productRepositoryProvider)));

final productStreamProvider = StreamProvider.family.autoDispose(
    (ref, String search) =>
        ref.read(productControllerProvider).productStream(search: search));

class ProductController {
  final ProductRepository _productRepository;

  ProductController({required ProductRepository productRepository})
      : _productRepository = productRepository;
  Stream<List<ProductModel>> productStream({required String search}) {
    return _productRepository.productStream(search: search);
  }

  Future<List<StockModel>?> getBatchStock({required String productName}) async {
    return await _productRepository.getBatchStockR(productName: productName);
  }

}
