import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_state.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/widgets/cart_item_card.dart';
import 'package:shopping_app/widgets/custom_appbar.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen();
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Your Cart',
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        // color: Colors.red[300],
        child: Container(
          margin: EdgeInsets.only(
            bottom: 15,
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: Text(
                  'Checkout',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Order',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.black),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              color: Constants.lightPrimary,
                              child: IconButton(
                                icon: Icon(Icons.home_rounded),
                                color: Constants.darkPrimary,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .length,
                            itemBuilder: (BuildContext context, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                // key: Key(state.cart.products[index].toString()),
                                onDismissed: (direction) {
                                  state.cart.products.removeAt(index);
                                  // ignore: deprecated_member_use
                                  Scaffold.of(context).showSnackBar(
                                      new SnackBar(
                                          content: Text('item dismissed')));
                                },
                                background: Container(color: Colors.red),
                                child: CartItemCard(
                                  product: state.cart
                                      .productQuantity(state.cart.products)
                                      .keys
                                      .elementAt(index),
                                  quantity: state.cart
                                      .productQuantity(state.cart.products)
                                      .values
                                      .elementAt(index),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: 60,
                        decoration:
                            BoxDecoration(color: Colors.black.withAlpha(60)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              '\$ ${state.cart.total}',
                              // '\$4.4',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text('something went wrong');
          }
        },
      ),
    );
  }
}
