import 'package:equatable/equatable.dart';
import 'package:shopping_app/models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}

class ProductLoading extends ProductState {}
