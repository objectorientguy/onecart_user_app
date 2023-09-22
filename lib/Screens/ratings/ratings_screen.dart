import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../common_widgets/button_widget.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../widgets/text_field_widget.dart';
import '../item_details/widgets/star_widget.dart';

class AddRatingsScreen extends StatefulWidget {
  const AddRatingsScreen({super.key});

  @override
  State<AddRatingsScreen> createState() => _AddRatingsScreenState();
}

class _AddRatingsScreenState extends State<AddRatingsScreen> {
  bool isExpanded = false;

  void toggleTextVisibility() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Ratings and Reviews',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Rating",
              style: Theme.of(context).textTheme.xTinier.copyWith(
                  color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            const StarDisplayWidget(
                filledStar: Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 65,
                ),
                unfilledStar: Icon(
                  Icons.star_rounded,
                  color: AppColor.lighterGrey,
                  size: 65,
                ),
                halfFilledStar: Icon(
                  Icons.star_half_rounded,
                  color: Colors.amber,
                  size: 65,
                ),
                value: 4),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Add Review",
              style: Theme.of(context).textTheme.xTinier.copyWith(
                  color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFieldWidget(
              onTextFieldChanged: (String textField) {},
              maxLines: 5,
              hintText: 'Type here...',
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: 'Cancel',
                  showRatingScreen: false,
                ),
                ButtonWidget(
                  title: 'Post',
                  showRatingScreen: false,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "People’s Rating and Reviews to this product",
              style: Theme.of(context).textTheme.xTinier.copyWith(
                  color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: smallestSpacing),
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: AppColor.paleFaintGrey,
                            borderRadius:
                                BorderRadius.circular(smallCardCurve)),
                        padding: const EdgeInsets.symmetric(
                            vertical: xxTinierSpacing,
                            horizontal: xxTinierSpacing),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 10,
                                      backgroundColor: AppColor.lighterGrey,
                                      child: Icon(
                                        Icons.person,
                                        color: AppColor.white,
                                        size: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Dave',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xTinier
                                          .copyWith(
                                              color: AppColor.mediumBlack,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                                const StarDisplayWidget(
                                    filledStar: Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    unfilledStar: Icon(
                                      Icons.star_border_rounded,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    halfFilledStar: Icon(
                                      Icons.star_half_rounded,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    value: 4),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                '“I got a pair of boots from store '
                                'X and I’m very satisfied. They are high-quality '
                                'and worth the money. The store also offered'
                                ' free shipping at that price so that’s a plus!”',
                                maxLines: isExpanded ? null : 2,
                                style: Theme.of(context).textTheme.tiniest),
                            GestureDetector(
                              onTap: toggleTextVisibility,
                              child: Text(
                                isExpanded ? 'Read Less' : 'Read More...',
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
