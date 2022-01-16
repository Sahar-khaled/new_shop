import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_bloc.dart';
import 'package:shopping_app/bloc/cart/cart_event.dart';
import 'package:shopping_app/bloc/cart/cart_state.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/widgets/custom_appbar.dart';
import 'package:shopping_app/widgets/main_carousel.dart';

class ItemDetails extends StatelessWidget {
  static const String routeName = '/itemDetails';

  final Product product;
  const ItemDetails({required this.product});

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ItemDetails(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Scaffold(
        backgroundColor: Constants.darkPrimary,
        appBar: CustomAppBar(
          title: product.name,
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                viewportFraction: 0.95,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 2,
                autoPlay: true,
              ),
              items: [
                MainCarousel(
                  product: product,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 40,
                    // alignment: Alignment.bottomCenter,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text('Item description',
                  style: Theme.of(context).textTheme.headline2!
                  // .copyWith(color: Colors.black),
                  ),
              children: [
                ListTile(
                  title: Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      wordSpacing: 2,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(
                //     color: Colors.amber,
                //   ),
                //   borderRadius: BorderRadius.all(Radius.circular(20)),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   margin: EdgeInsets.only(top: 10),
                        //   child: Text(
                        //     "remove",
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 20),
                        //   ),
                        // ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                return Container(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 20),
                                    ),

                                    child: Text(
                                      'Add To Cart',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(color: Colors.white),
                                    ),

                                    // style: ButtonStyle(
                                    //     backgroundColor:
                                    //         MaterialStateProperty.all(
                                    //             Constants.headLinePrimary),
                                    //     shape: MaterialStateProperty.all<
                                    //             RoundedRectangleBorder>(
                                    //         RoundedRectangleBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(18.0),
                                    //             side: BorderSide(
                                    //                 color: Colors.red)))),
                                    onPressed: () {
                                      context
                                          .read<CartBloc>()
                                          .add(CartProductAdded(product));
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          content: Text(
                                            'This item added to your cart',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ],
        ),

        // bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}
