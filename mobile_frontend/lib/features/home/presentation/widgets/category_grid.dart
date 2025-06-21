import 'package:QuickBooks/config/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/gen/assets.gen.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(category.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
                // Centered name
                Center(
                  child: Text(
                    category.name,
                    style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Category {
  final String name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}

final categories = [
  Category(
    name: 'Restaurants',
    imagePath:
        Assets.images.placeholders.restaurant.path,
  ),
  Category(
    name: 'Hotels',
    imagePath:Assets.images.placeholders.restaurant.path),
  Category(
    name: 'Beauty',
    imagePath:Assets.images.placeholders.restaurant.path  ),
  Category(
    name: 'Education',
    imagePath:Assets.images.placeholders.restaurant.path ),
];

