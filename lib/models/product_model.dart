import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final int price;
  final bool hasDiscount;
  final bool topRated;
  final bool isPopular;
  final bool recentlyViewed;
  final int discount;


 const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.hasDiscount,
      required this.topRated,
      required this.isPopular,
      required this.recentlyViewed ,
      required this.discount});

      static Product fromSnapShot(DocumentSnapshot snapshot){
  Product product = Product(
      name: snapshot['name'],
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'],
      hasDiscount: snapshot['hasDiscount'],
      topRated: snapshot['topRated'],
      isPopular: snapshot['isPopular'],
      recentlyViewed: snapshot['recentlyViewed'],
      discount : snapshot['discount'],
);
      return product;
}

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        hasDiscount,
        topRated,
        isPopular,
        recentlyViewed,
        discount
      ];




  static List<Product> products = [
    Product(
      name: 'carrots',
      category: 'vegetables',
      imageUrl:
          'https://www.freshpoint.com/wp-content/uploads/commodity-carrot.jpg',
      price: 3,
      hasDiscount: true,
      isPopular: true,
      topRated: false,
      recentlyViewed: true,
      discount: 2,
    ),
    Product(
      name: 'strewberry',
      category: 'fruits',
      imageUrl:
          'https://media.istockphoto.com/photos/fresh-strawberries-background-picture-id477834644?b=1&k=20&m=477834644&s=170667a&w=0&h=eMKfTv5lt22yBKf0Q5H-dJ_FnZfd0kRqZs8Qi84SBKQ=',
      price: 15,
      hasDiscount: false,
      isPopular: true,
      topRated: true,
      recentlyViewed: false,
            discount: 2,

    ),
    Product(
      name: 'mango',
      category: 'fruits',
      imageUrl:
          'https://media.istockphoto.com/photos/multiple-mangos-one-cut-and-one-sliced-in-a-pattern-picture-id450724125?k=20&m=450724125&s=612x612&w=0&h=9wmoT2WSpfviH1mgNqxMO8PS5rlZpykE-Dem7dUKHl0=',
      price: 30,
      hasDiscount: false,
      isPopular: false,
      topRated: true,
      recentlyViewed: false,
            discount: 2,

    ),
    Product(
      name: 'candy-corn',
      category: 'candy',
      imageUrl:
          'https://media.istockphoto.com/photos/colorful-candy-corn-for-halloween-picture-id514131515?k=20&m=514131515&s=612x612&w=0&h=zmCq73Mysa6BU3F-ZrHgR4NKsXNbHR0_WjGrGjrQdRI=',
      price: 50,
      hasDiscount: true,
      isPopular: false,
      topRated: true,
      recentlyViewed: false,
            discount: 2,

    ),
    Product(
      name: 'cheese-cake',
      category: 'sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1543773495-2cd9248a5bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3dlZXRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 75,
      hasDiscount: false,
      isPopular: true,
      topRated: true,
      recentlyViewed: false,
            discount: 2,

    ),
    Product(
      name: 'pasta',
      category: 'red-pasta',
      imageUrl:
          'https://images.unsplash.com/photo-1630409352591-abc3cb4635de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVkcGFzdGF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 3,
      hasDiscount: true,
      isPopular: true,
      topRated: true,
      recentlyViewed: true,
            discount: 2,

    ),
    Product(
      name: 'lemon',
      category: 'drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      price: 30,
      hasDiscount: true,
      isPopular: true,
      topRated: false,
      recentlyViewed: true,
            discount: 2,

    ),
  ];
}
