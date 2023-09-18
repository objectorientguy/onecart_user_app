import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = 'WishlistScreen';

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'WishList',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        borderRadius: BorderRadius.circular(kEditRadius)),
                    padding: const EdgeInsets.symmetric(
                        vertical: tiniestSpacing,
                        horizontal: xxxSmallestSpacing),
                    child: const Text('Fruits'),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: tiniestSpacing,
                  );
                },
              ),
            ),
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primary),
                      borderRadius: BorderRadius.circular(kEditRadius)),
                  padding: const EdgeInsets.symmetric(
                      vertical: tiniestSpacing, horizontal: xxxSmallestSpacing),
                  child: const Text('Fruits'),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: tiniestSpacing,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
