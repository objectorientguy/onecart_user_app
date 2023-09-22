import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../common_widgets/button_widget.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: tinierSpacing,
            crossAxisSpacing: tinierSpacing,
            crossAxisCount: 2,
            childAspectRatio: 0.68),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: AppColor.paleFaintGrey,
                borderRadius: BorderRadius.circular(kAddRadius)),
            width: kHorizontalCategoryListItemWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: xxTinierSpacing, vertical: xxTiniestSpacing),
              child: Stack(alignment: Alignment.topRight, children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(tiniestSpacing),
                          child: Container(
                              height: kCardHeightItem,
                              width: kWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      kBorderRadiusSmall)),
                              child: Image.asset('assets/img_2.png',
                                  fit: BoxFit.fill))),
                      SizedBox(
                          child: Text(
                              'Lays American Style Cream and Onion Potato Chips ',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTinier
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false)),
                      const SizedBox(
                        height: xxTinierSpacing,
                      ),
                      SizedBox(
                        child: Text(
                          '196 gm',
                          style: Theme.of(context)
                              .textTheme
                              .tiniest
                              .copyWith(color: AppColor.primary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: xxxTiniestSpacing),
                      Text('₹29',
                          style: Theme.of(context).textTheme.xxTinier.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.lightestGrey)),
                      const SizedBox(height: xxTiniestSpacing),
                      const ButtonWidget(
                        title: 'Add to Cart',
                      )
                    ]),
                const Icon(Icons.close,
                    size: kIconSizeSmall, color: AppColor.grey)
              ]),
            ),
          );
        });
  }
}
