import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_event.dart';
import 'package:shopping_app/bloc/cart/cart_state.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/item_details.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthCard;

  const ProductCard({
    required this.product,
    this.widthCard = 2.5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            isScrollControlled: true,
            context: (context),
            enableDrag: true,
            isDismissible: true,
            backgroundColor: Constants.darkPrimary,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.9,
                child: ItemDetails(
                  product: product,
                ),
              );
            });
      },

      // onTap: ()
      //  {
      //   Navigator.pushNamed(
      //    context, '/itemDetails' ,
      //    arguments: product);
      // },

      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthCard,
            height: 125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 65,
                decoration: BoxDecoration(
                  color: Constants.darkPrimary.withAlpha(50),
                ),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5 - 10,
                height: 55,
                decoration: BoxDecoration(
                  color: Constants.darkPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              '\$ ${product.price}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                        if (state is CartLoading) {
                          return Center(
                            child: Text(''),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: Text(
                                      'This item added to your cart',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else
                          return Text('something went error');
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          product.hasDiscount
              ? Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber[600],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Text(
                          '\%${product.discount}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
