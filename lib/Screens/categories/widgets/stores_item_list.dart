import 'package:flutter/material.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';
import '../../home/widgets/product_tile_widget.dart';
import '../../item_details/item_details_screen.dart';

class StoreItemList extends StatelessWidget {
  final List<Deal> storedata;
  final bool toShow;

  const StoreItemList({
    super.key,
    required this.storedata,
    required this.toShow,
  });

  @override
  Widget build(BuildContext context) {
    storedata.sort((a, b) => a.price!.compareTo(b.price!));


    double screenwidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(
          children: [
            const SizedBox(height: 40),
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: storedata.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ItemDetailsScreen.routeName,
                        arguments: storedata[index]);
                  },
                  child: ProductTileWidget(
                    screenwidth: screenwidth,
                    data: storedata,
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
      ),
    );
  }
}
