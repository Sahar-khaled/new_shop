import 'package:flutter/material.dart';
import 'package:shopping_app/models/category_model.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/cart/cart_screen.dart';
import 'package:shopping_app/screens/category_items.dart';
import 'package:shopping_app/screens/home/home_screen.dart';
import 'package:shopping_app/screens/item_details.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CategoryItemsScreen.routeName:
        return CategoryItemsScreen.route(
            category: settings.arguments as Category);

      case ItemDetails.routeName:
        return ItemDetails.route(product: settings.arguments as Product);
      default:
        return _errorNavigation();
    }
  }

  static Route _errorNavigation() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      ),
    );
  }
}
