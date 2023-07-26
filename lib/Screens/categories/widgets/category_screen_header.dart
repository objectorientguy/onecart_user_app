import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimentions.dart';
import '../../../configs/app_spacing.dart';

class CategoryScreenHeader extends StatelessWidget {
  const CategoryScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
        BoxShadow(
            blurStyle: BlurStyle.solid,
            color: AppColor.lightGrey,
            spreadRadius: kZero,
            blurRadius: kShadowBlurRadius),
      ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            leftRightMargin, 0, leftRightMargin, leftRightMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: kCircleAvatarRadius,
              backgroundImage: AssetImage('assets/img.png'),
            ),
            const SizedBox(
              height: tinySpacing,
            ),
            const Row(
              children: [
                Text(
                  'Fruits and vegetables',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: xxTinySpacing,
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.primary,
                  size: 26,
                ),
              ],
            ),
            const SizedBox(
              height: tinySpacing,
            ),
            const Row(
              children: [
                Text(
                  '21 Stores · 234 Products',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color: AppColor.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: tinySpacing,
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButton<String>(
                        isDense: true,
                        value: 'Exotic Fruits and vegetables',
                        hint: const Text(
                          'Exotic Fruits & vegetables',
                          style: TextStyle(color: AppColor.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        onChanged: (newValue) {},
                        icon: const Icon(Icons.keyboard_arrow_down_outlined,
                            color: AppColor.primary),
                        isExpanded: true,
                        underline:
                            const SizedBox(), // Hides the default underline
                        items: const []),
                  ),
                ),
                const SizedBox(
                  width: tinierSpacing,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        '2 Filters',
                        style: TextStyle(color: AppColor.primary, fontSize: 16),
                      )),
                ),
                const SizedBox(
                  width: tinierSpacing,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButton<String>(
                        isDense: true,
                        value: 'Exotic Fruits and vegetables',
                        hint: const Text(
                          'Price',
                          style: TextStyle(color: AppColor.primary),
                          overflow: TextOverflow.ellipsis,
                        ),
                        onChanged: (newValue) {},
                        icon: const Icon(Icons.arrow_downward,
                            color: AppColor.primary),
                        isExpanded: true,
                        underline:
                            const SizedBox(), // Hides the default underline
                        items: const []),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
