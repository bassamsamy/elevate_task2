
import 'product_model.dart';
import 'remote_data_source.dart';
class ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepository({required this.remoteDataSource});

  Future<List<ProductModel>> getProducts() async {
    return await remoteDataSource.fetchProducts();
  }


}
