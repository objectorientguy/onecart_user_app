import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/ratings/widgets/ratings_list_body.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../item_details/widgets/star_widget.dart';

class RatingsListWidget extends StatefulWidget {
  const RatingsListWidget({super.key});

  @override
  State<RatingsListWidget> createState() => _RatingsListWidgetState();
}

class _RatingsListWidgetState extends State<RatingsListWidget> {
  bool isExpanded = false;

  void toggleTextVisibility() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    borderRadius: BorderRadius.circular(smallCardCurve)),
                padding: const EdgeInsets.symmetric(
                    vertical: xxTinierSpacing, horizontal: xxTinierSpacing),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: kAvatarRadius,
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
                      const SizedBox(
                        height: xxxTinierSpacing,
                      ),
                      Text(
                          '“I got a pair of boots from store '
                          'X and I’m very satisfied. They are high-quality '
                          'and worth the money. The store also offered'
                          ' free shipping at that price so that’s a plus!”',
                          maxLines: isExpanded ? null : 2,
                          style: Theme.of(context).textTheme.tiniest),
                      const RatingsListBody()
                    ]));
          }),
    );
  }
}
