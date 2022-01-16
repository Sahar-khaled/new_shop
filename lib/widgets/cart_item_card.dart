import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_event.dart';
import 'package:shopping_app/bloc/cart/cart_state.dart';
import 'package:shopping_app/models/product_model.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartItemCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                product.imageUrl,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    '\$ ${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(product));
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        size: 30,
                      ),
                    );
                  },
                ),
                Text(
                  '$quantity',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                      },
                      icon: Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
