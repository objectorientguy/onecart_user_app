import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/product_tile_widget.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';
import '../../item_details/item_details_screen.dart';

class SearchProductList extends StatelessWidget {
  final List<Deal> data;

  const SearchProductList(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                ratingShow: true,
                data: data[index],
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
    );
  }
}
