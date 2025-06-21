import 'package:QuickBooks/config/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/styles.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:
          offers
              .map(
                (offer) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(
                          offer.imageUrl,
                          width: double.infinity,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.primaryColor.withOpacity(0.65),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        right: 5,
                        top: 15.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.title,
                              style: Styles.textStyle20.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              maxLines: 2,
                              offer.description,
                              style: Styles.textStyle14.copyWith(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
        aspectRatio: 16 / 6,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        enlargeCenterPage: false,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class OfferModel {
  final String title;
  final String description;
  final String imageUrl;

  OfferModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

final offers = [
  OfferModel(
    title: "Special Offer!",
    description: "Get 20% off on your first booking.",
    imageUrl:
        "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
  ),
  OfferModel(
    title: "Summer Deal",
    description: "Enjoy your summer with 30% discount in Chello.",
    imageUrl:
        "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=800&q=80",
  ),
];
