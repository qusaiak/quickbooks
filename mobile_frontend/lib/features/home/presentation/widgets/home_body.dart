import 'package:QuickBooks/features/home/presentation/widgets/appbar_widget.dart';
import 'package:QuickBooks/features/home/presentation/widgets/category_grid.dart';
import 'package:QuickBooks/features/home/presentation/widgets/offer_widget.dart';
import 'package:QuickBooks/features/home/presentation/widgets/popular_widget.dart';
import 'package:QuickBooks/features/home/presentation/widgets/row_title.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      color: AppColor.primaryColor,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(),
              const SizedBox(height: 25),
              OfferWidget(),
              const SizedBox(height: 15),
              RowTitle(
                iconData: Icons.category_outlined,
                title: "Categories",
                onTab: () {},
              ),
              CategoryGrid(),
              const SizedBox(height: 15),
              RowTitle(
                iconData: Icons.trending_up_outlined,
                title: "Most Popular",
                onTab: () {},
              ),
              PopularWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
