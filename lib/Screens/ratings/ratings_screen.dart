import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/ratings_bloc/ratings_bloc.dart';
import '../../blocs/ratings_bloc/ratings_events.dart';
import '../../common_widgets/button_widget.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../widgets/text_field_widget.dart';

class AddRatingsScreen extends StatelessWidget {
  static const routeName = 'AddRatingsScreen';

  int postRating;
  final int productId;
  static Map reviewTextMap = {};

  AddRatingsScreen({super.key, this.postRating = 0, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GenericAppBar(
          title: 'Ratings and Reviews',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Add Rating",
              style: Theme.of(context).textTheme.xTinier.copyWith(
                  color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: tinierSpacing,
            ),
            RatingBar.builder(
              itemSize: kRatingIconBig,
              itemBuilder: (context, index) => const Icon(
                Icons.star_rounded,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                postRating = rating.toInt();
              },
              maxRating: 1,
            ),
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
              onTextFieldChanged: (value) {
                reviewTextMap["review_text"] = value;
              },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'Cancel',
                ),
                ButtonWidget(
                  onPressed: () {
                    Map reviewMap = {
                      "rating": postRating,
                      "review_text": reviewTextMap["review_text"]
                    };
                    context
                        .read<RatingsBloc>()
                        .add(AddRatings(reviewMap: reviewMap));
                    Navigator.pop(context);
                    context
                        .read<RatingsBloc>()
                        .add(GetAllRatings(productId: productId));
                  },
                  title: 'Post',
                ),
              ],
            ),
          ]),
        ));
  }
}
