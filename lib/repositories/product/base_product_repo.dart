import 'package:shopping_app/models/product_model.dart';

abstract class BaseProductRepository {
  Stream <List<Product>> getAllProducts ();
}