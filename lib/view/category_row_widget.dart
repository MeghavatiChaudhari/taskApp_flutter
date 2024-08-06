import 'package:flutter/material.dart';

import 'package:taskapp/view//category_widget.dart';

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PersonalCategoryWidget(),
        OfficeCategoryWidget(),
        CollegeCategoryWidget(),
      ],
    );
  }
}
