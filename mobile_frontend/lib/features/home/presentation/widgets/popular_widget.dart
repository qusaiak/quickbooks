import 'package:QuickBooks/config/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/colors.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(width: 10.h),
        itemBuilder:
            (context, index) => Container(
              width: 180.w,
              decoration: BoxDecoration(
                color: AppColor.gray300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=800&q=80',
                      height: 110.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 2,
                          'Restaurant & Cafe Chello',
                          style: Styles.textStyle14.copyWith(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColor.secondaryColor,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Swieda',
                              style: Styles.textStyle12.copyWith(
                                color: AppColor.secondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.secondaryColor,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(100, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('Details',style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
