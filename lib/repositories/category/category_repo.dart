import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/models/category_model.dart';
import 'package:shopping_app/repositories/category/base_category_repo.dart';

class CategoryRepository extends BaseCategoryRepo {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => Category.fromSnapShot(e)).toList();
    });
  }
}
