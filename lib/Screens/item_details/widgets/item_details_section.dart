import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../blocs/varient_bloc/varient_bloc.dart';
import '../../../blocs/varient_bloc/varient_events.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/item_details/item_details_model.dart';
import '../../varient/select_varient_screen.dart';

class ItemDetailsSection extends StatelessWidget {
  final ItemDetailsData itemData;
  static Map cartItemsDetailsMap = {};


   const ItemDetailsSection({
    required this.itemData,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    cartItemsDetailsMap = {

    };
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.3 * leftRightMargin),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              itemData.productName.toString(),
              style: Theme.of(context).textTheme.headingLarge,
            ),
          ),
          const SizedBox(height: tinySpacing),
          InkWell(
            onTap: () {
              context
                  .read<SelectVarientBloc>()
                  .add(GetAllVarients(itemData.productId!));
              Navigator.pushNamed(context, SelectVariantScreen.routeName,
                  arguments: itemData);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: tinierSpacing, vertical: tinierSpacing),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryMedium, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(itemData.weight.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .textLarge
                          .copyWith(fontWeight: FontWeight.w600)),
                  const Icon(Icons.arrow_forward_ios,
                      color: AppColor.primary, size: 20)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tiniestSpacing, vertical: xxxSmallestSpacing),
            child: Row(
              children: [
                const StarDisplayWidget(
                    filledStar: Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    unfilledStar: Icon(
                      Icons.star_border,
                      color: Colors.amber,
                      size: 20,
                    ),
                    halfFilledStar: Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 20,
                    ),
                    value: 2.5),
                const SizedBox(width: xxxTinierSpacing),
                Text('5 Ratings',
                    style: Theme.of(context)
                        .textTheme
                        .textButtonSmall
                        .copyWith(fontSize: 15)),
                const SizedBox(width: xxxTinierSpacing),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primary,
                  size: 16,
                )
              ],
            ),
          ),
          const SizedBox(height: xxxTiniestSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: xxxTinierSpacing),
                child: Row(
                  children: [
                    Text(
                      '₹${itemData.discountedCost.toString()}',
                      style: Theme.of(context).textTheme.headingTiny,
                    ),
                    const SizedBox(width: xxxTinierSpacing),
                    Text(
                      '₹${itemData.price.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .subHeadingMedium
                          .copyWith(decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(width: xxxTinierSpacing),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                          color: AppColor.primaryLight,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(
                          vertical: xxTiniestSpacing,
                          horizontal: xxTinierSpacing),
                      child: Center(
                        child: Text('${itemData.discount.toString()}%OFF',
                            style: Theme.of(context)
                                .textTheme
                                .textSmall
                                .copyWith(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.w700)),
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                      horizontal: xxTinySpacing, vertical: xxTinierSpacing),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: AppColor.primary,
                ),
                child: Text('ADD TO CART',
                    style: Theme.of(context).textTheme.textButtonLarge),
              ),
            ],
          ),
          const SizedBox(height: xxxTinySpacing),
          SizedBox(height: 200, child: Text(itemData.description.toString())),

          // Text('description'),
        ],
      ),
    );
  }
}

class StarDisplayWidget extends StatelessWidget {
  final double value;
  final Widget filledStar;
  final Widget unfilledStar;
  final Widget halfFilledStar;

  const StarDisplayWidget({
    Key? key,
    this.value = 0,
    required this.filledStar,
    required this.unfilledStar,
    required this.halfFilledStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return index < value
            ? (value - index < 1 && value % index != 0)
                ? halfFilledStar
                : filledStar
            : unfilledStar;
      }),
    );
  }
}
