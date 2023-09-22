import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../Screens/item_details/widgets/star_widget.dart';
import '../Screens/ratings/ratings_screen.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool showRatingScreen;
  final bool showRatingAlertBox;

  const ButtonWidget(
      {super.key,
      required this.title,
      this.showRatingScreen = false,
      this.showRatingAlertBox = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kImage,
      child: TextButton(
        onPressed: () {
          if (showRatingScreen == true) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddRatingsScreen()));
          } else if (showRatingAlertBox == true) {
            {
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
                              size: kRatingIcon,
                            ),
                            unfilledStar: Icon(
                              Icons.star_border_rounded,
                              color: Colors.amber,
                              size: kRatingIcon,
                            ),
                            halfFilledStar: Icon(
                              Icons.star_half_rounded,
                              color: Colors.amber,
                              size: kRatingIcon,
                            ),
                            value: 4),
                      ],
                    ),
                    content: Text(
                        '“I got a pair of boots from store '
                        'X and I’m very satisfied. They are high-quality '
                        'and worth the money. The store also offered'
                        ' free shipping at that price so that’s a plus!”',
                        style: Theme.of(context).textTheme.tiniest.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500)),
                  );
                },
              );
            }
          }
        },
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(
              horizontal: tinierSpacing, vertical: tiniestSpacing),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kAddRadius)),
          backgroundColor: AppColor.primary,
        ),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .xxxTinier
                .copyWith(color: AppColor.white)),
      ),
    );
  }
}
