import 'package:equatable/equatable.dart';
import 'package:shopping_app/models/product_model.dart';

class Cart extends Equatable {
 final List<Product>products;
 const Cart({this.products = const <Product>[] });

// get total price for products
double get total =>
products.fold(0, (total, current) => total + current.price);

String get totalString => total.toStringAsFixed(2);


 Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }
// static List<Product> products = [


//     Product(
//       name: 'mango' ,
//       category: 'fruits',
//       imageUrl: 'https://media.istockphoto.com/photos/multiple-mangos-one-cut-and-one-sliced-in-a-pattern-picture-id450724125?k=20&m=450724125&s=612x612&w=0&h=9wmoT2WSpfviH1mgNqxMO8PS5rlZpykE-Dem7dUKHl0=',
//       price: 30,
//       hasDiscount: false,
//       isPopular: false,
//       topRated: true,
//       recentlyViewed :false,
//     ),
//     Product(
//       name: 'candy-corn' ,
//       category: 'candy',
//       imageUrl: 'https://media.istockphoto.com/photos/colorful-candy-corn-for-halloween-picture-id514131515?k=20&m=514131515&s=612x612&w=0&h=zmCq73Mysa6BU3F-ZrHgR4NKsXNbHR0_WjGrGjrQdRI=',
//       price: 50,
//       hasDiscount: true,
//       isPopular: false,
//       topRated: true,
//       recentlyViewed: false ,
//     ),
//     Product(
//       name: 'cheese-cake' ,
//       category: 'sweets',
//       imageUrl: 'https://images.unsplash.com/photo-1543773495-2cd9248a5bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3dlZXRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//       price: 75,
//       hasDiscount: false,
//       isPopular: true,
//       topRated: true,
//             recentlyViewed: false ,

//     ),
//       Product(
//       name: 'mango' ,
//       category: 'fruits',
//       imageUrl: 'https://media.istockphoto.com/photos/multiple-mangos-one-cut-and-one-sliced-in-a-pattern-picture-id450724125?k=20&m=450724125&s=612x612&w=0&h=9wmoT2WSpfviH1mgNqxMO8PS5rlZpykE-Dem7dUKHl0=',
//       price: 30,
//       hasDiscount: false,
//       isPopular: false,
//       topRated: true,
//       recentlyViewed :false,
//     ),
//     Product(
//       name: 'pasta' ,
//       category: 'red-pasta',
//       imageUrl: 'https://images.unsplash.com/photo-1630409352591-abc3cb4635de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVkcGFzdGF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
//       price: 3.22,
//       hasDiscount: true,
//       isPopular: true,
//       topRated: true,
//             recentlyViewed: true ,

//     ),
//     Product(
//       name: 'lemon' ,
//       category: 'drinks',
//       imageUrl: 'https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//       price: 30.22,
//       hasDiscount: true,
//       isPopular: true,
//       topRated: false,
//             recentlyViewed: true ,

//     ),
//   ];

  @override
  List<Object?> get props => [products];
}