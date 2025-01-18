import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import"data/remote_data_source.dart";
import 'data/product_repository.dart';
import 'presentation/product_cubit.dart';
import 'presentation/products_screen.dart';

void main() {
  final remoteDataSource = RemoteDataSource();
  final productRepository = ProductRepository(remoteDataSource: remoteDataSource);

  runApp(MyApp(productRepository: productRepository));
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;

  const MyApp({required this.productRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductCubit(productRepository),
        child: ProductsScreen(),
      ),
    );
  }
}
