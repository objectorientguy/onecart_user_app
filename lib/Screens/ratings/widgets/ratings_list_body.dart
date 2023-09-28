import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/ratings_model/view_ratings_model.dart';
import '../../item_details/widgets/star_widget.dart';
import '../ratings_screen.dart';

class RatingsListBody extends StatelessWidget {
  final List<RatingsData> ratingsDetails;
  final int index;

  const RatingsListBody(
      {super.key, required this.ratingsDetails, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(smallCardCurve))),
              iconPadding: const EdgeInsets.only(left: leftRightMargin),
              icon: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: kStarIcon,
                    ),
                  )),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: kAvatar,
                        backgroundColor: AppColor.lighterGrey,
                        child: Icon(
                          Icons.person,
                          color: AppColor.white,
                          size: kRatingIcon,
                        ),
                      ),
                      const SizedBox(
                        width: xxxTinierSpacing,
                      ),
                      Text(
                        ratingsDetails[index].customerName,
                        style: Theme.of(context).textTheme.xTinier.copyWith(
                            color: AppColor.mediumBlack,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  StarDisplayWidget(
                      filledStar: const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: kRatingIcon,
                      ),
                      unfilledStar: const Icon(
                        Icons.star_border_rounded,
                        color: Colors.amber,
                        size: kRatingIcon,
                      ),
                      halfFilledStar: const Icon(
                        Icons.star_half_rounded,
                        color: Colors.amber,
                        size: kRatingIcon,
                      ),
                      value: ratingsDetails[index].rating.toDouble()),
                ],
              ),
              content: Text(AddRatingsScreen.reviewTextMap["review_text"],
                  style: Theme.of(context).textTheme.tiniest.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500)),
            );
          },
        );
      },
      child: Text(
        'Read More...',
        style: Theme.of(context)
            .textTheme
            .tiniest
            .copyWith(color: AppColor.primary, fontWeight: FontWeight.w500),
      ),
    );
  }
}
