import 'package:flutter/material.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/models/category_model.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/widgets/custom_appbar.dart';
import 'package:shopping_app/widgets/custom_navbar.dart';
import 'package:shopping_app/widgets/product_card.dart';

class CategoryItemsScreen extends StatelessWidget {
  static const String routeName = '/categoryItems';
  final Category category;

  const CategoryItemsScreen({Key? key, required this.category})
      : super(key: key);

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CategoryItemsScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryItems = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      backgroundColor: Constants.lightPrimary,
      appBar: CustomAppBar(

        title: category.name,
      ),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 12.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemCount: categoryItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              widthCard: 2.5,
              product: categoryItems[index],
            );
          }),
    );
  }
}
