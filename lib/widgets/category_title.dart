import 'package:flutter/material.dart';
import 'package:shopping_app/constants/colors.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  const CategoryTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Constants.darkPrimary),
        ),
      ),
    );
  }
}
