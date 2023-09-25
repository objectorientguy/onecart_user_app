import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/ratings/widgets/ratings_list_widget.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../common_widgets/button_widget.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../widgets/text_field_widget.dart';
import '../item_details/widgets/star_widget.dart';

class AddRatingsScreen extends StatelessWidget {
  const AddRatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Ratings and Reviews',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Add Rating",
            style: Theme.of(context).textTheme.xTinier.copyWith(
                color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: tinierSpacing,
          ),
          const StarDisplayWidget(
              filledStar: Icon(
                Icons.star_rounded,
                color: Colors.amber,
                size: kRatingIconBig,
              ),
              unfilledStar: Icon(
                Icons.star_rounded,
                color: AppColor.lighterGrey,
                size: kRatingIconBig,
              ),
              halfFilledStar: Icon(
                Icons.star_half_rounded,
                color: Colors.amber,
                size: kRatingIconBig,
              ),
              value: 4),
          const SizedBox(
            height: tinierSpacing,
          ),
          Text(
            "Add Review",
            style: Theme.of(context).textTheme.xTinier.copyWith(
                color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: tinierSpacing,
          ),
          TextFieldWidget(
            onTextFieldChanged: (String textField) {},
            maxLines: 5,
            hintText: 'Type here...',
            hintStyle: Theme.of(context).textTheme.xxTinier.copyWith(
                color: AppColor.grey,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
            filled: true,
            fillColor: AppColor.primaryLight,
          ),
          const SizedBox(
            height: tinierSpacing,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(
                title: 'Cancel',
              ),
              ButtonWidget(
                title: 'Post',
              ),
            ],
          ),
          const SizedBox(
            height: xxTinySpacing,
          ),
          Text(
            "People’s Rating and Reviews to this product",
            style: Theme.of(context).textTheme.xTinier.copyWith(
                color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: xxTinySpacing,
          ),
          const RatingsListWidget()
        ]),
      ),
    );
  }
}
