import 'package:bloc/bloc.dart';
import '../data/product_repository.dart';
import 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await _productRepository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to fetch products"));
    }
  }
}