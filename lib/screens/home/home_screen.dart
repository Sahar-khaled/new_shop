import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/category/bloc/category_bloc.dart';
import 'package:shopping_app/bloc/productt/product_bloc.dart';
import 'package:shopping_app/bloc/productt/product_state.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/widgets/category_title.dart';
import 'package:shopping_app/widgets/custom_appbar.dart';
import 'package:shopping_app/widgets/main_carousel.dart';
import 'package:shopping_app/widgets/product_carousel.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Constants.lightPrimary,
      appBar: CustomAppBar(
        title: 'Main Categories',
      ),
      // bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        viewportFraction: 0.95,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 2,
                        autoPlay: true,
                      ),
                      items: state.categories
                          .map((e) => MainCarousel(category: e))
                          .toList(),
                    );
                  } else
                    return Text('something went wrong');
                },
              ),
            ),
            CategoryTitle(
              title: 'Top Rated' ,
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.topRated)
                        .toList(),
                  );
                } else
                  return Text('Error has occured');
              },
            ),
             CategoryTitle(
              title: 'Most Selling',
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList(),
                  );
                } else
                  return Text('Error has occured');
              },
            ),
              CategoryTitle(
              title: 'Recently Viewed',
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.recentlyViewed)
                        .toList(),
                  );
                } else
                  return Text('Error has occured');
              },
            ),

          ],
        ),
      ),
    );
  }
}
