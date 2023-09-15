import 'package:flutter/material.dart';

import 'package:onecart_user_app/Screens/item_details/widgets/rating_widget.dart';

import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';

import '../../varient/select_varient_screen.dart';
import 'delivery_details_section.dart';
import 'frequently_bought_widget.dart';
import 'item_details_price.dart';

class ItemDetailsBody extends StatelessWidget {
  final Product itemData;

  const ItemDetailsBody({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ItemDetailsPrice(itemData: itemData),
      const SizedBox(height: tinierSpacing),
      InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: AppColor.blue,
              isScrollControlled: true,
              useSafeArea: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(smallCardCurve),
                      topLeft: Radius.circular(smallCardCurve))),
              context: context,
              builder: (BuildContext context) {
                return SelectVariantScreen(
                  dataone: itemData,
                );
              });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: tinierSpacing, vertical: tinierSpacing),
          decoration: BoxDecoration(
            border:
                Border.all(color: AppColor.lightestGrey, width: kBorderWidth),
            borderRadius: BorderRadius.circular(kAddRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: kVarientBoxHeight,
                child: Text(itemData.variants[0].quantity.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .tinier
                        .copyWith(fontWeight: FontWeight.w500)),
              ),
              const Icon(Icons.keyboard_arrow_down,
                  color: AppColor.primary, size: kForwardIconSize)
            ],
          ),
        ),
      ),
      const RatingWidget(),
      Text('Product Details',
          style: Theme.of(context)
              .textTheme
              .tinier
              .copyWith(fontWeight: FontWeight.w500)),
      const SizedBox(
        height: tiniestSpacing,
      ),
      SizedBox(child: Text(itemData.details.toString())),
      const SizedBox(height: xxxTinySpacing),
      Text('Product Description',
          style: Theme.of(context)
              .textTheme
              .tinier
              .copyWith(fontWeight: FontWeight.w500)),
      const SizedBox(
        height: tiniestSpacing,
      ),
      SizedBox(child: Text(itemData.variants[0].description.toString())),
      const SizedBox(height: xxxTinierSpacing),
      const Divider(thickness: kFeatureDivider),
      const SizedBox(height: xxTiniestSpacing),
      const DeliverDetailsSection(),
      const SizedBox(height: xxTiniestSpacing),
      const Divider(thickness: kFeatureDivider),
      const SizedBox(height: xxxTinierSpacing),
      Text('Frequently Bought Together',
          style: Theme.of(context)
              .textTheme
              .tinier
              .copyWith(fontWeight: FontWeight.w500)),
      const SizedBox(
        height: xxTinierSpacing,
      ),
      const FrequentlyBoughtItems()
    ]);
  }
}
