import 'package:flutter/material.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';
import '../../home/widgets/product_tile_widget.dart';
import '../../item_details/item_details_screen.dart';

class StoreItemList extends StatelessWidget {
  final List<TodaySDeal> storedata;
  final bool toShow;

  const StoreItemList({
    super.key,
    required this.storedata,
    required this.toShow,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
            child: Column(children: [
              const SizedBox(height: xMediumSpacing),
              ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: storedata.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ItemDetailsScreen.routeName,
                              arguments: storedata[index]);
                        },
                        child: ProductTileWidget(
                          ratingShow: true,
                          data: storedata[index],
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: xxxSmallSpacing,
                    );
                  })
            ])));
  }
}
