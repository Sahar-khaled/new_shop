import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/repositories/product/base_product_repo.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => Product.fromSnapShot(e)).toList();
    });
  }

}
