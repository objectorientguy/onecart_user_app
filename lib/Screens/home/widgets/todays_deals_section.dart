import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/product_tile_widget.dart';

import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';
import '../../item_details/item_details_screen.dart';

class TodayDealsSection extends StatelessWidget {
  static const routeName = 'TodayDealsSection';
  final List<Deal> data;

  const TodayDealsSection(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: leftRightMargin, vertical: topBottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Deals",
            style: Theme.of(context).textTheme.headingTiny,
          ),
          const SizedBox(
            height: xxTinySpacing,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ItemDetailsScreen.routeName,
                      arguments: data[index]);
                },
                child: ProductTileWidget(
                  screenwidth: screenwidth,
                  data: data,
                  index: index,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: xxxSmallSpacing,
              );
            },
          ),
        ],
      ),
    );
  }
}
