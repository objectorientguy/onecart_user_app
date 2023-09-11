import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../blocs/varient_bloc/varient_bloc.dart';
import '../../../blocs/varient_bloc/varient_events.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/item_details/item_details_model.dart';
import '../../varient/select_varient_screen.dart';
import 'delivery_details_section.dart';
import 'item_details_body.dart';

class ItemDetailsSection extends StatelessWidget {
  final ItemDetailsData itemData;

  const ItemDetailsSection({
    required this.itemData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.3 * leftRightMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemData.productName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .tiny
                  .copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: tinySpacing),
          InkWell(
            onTap: () {
              context
                  .read<SelectVarientBloc>()
                  .add(GetAllVarients(itemData.productId!));
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
                border: Border.all(
                    color: AppColor.lightestGrey, width: kBorderWidth),
                borderRadius: BorderRadius.circular(kAddRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: kVarientBoxHeight,
                    child: Text(itemData.weight.toString(),
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
          ItemDetailsBody(
            itemData: itemData,
          ),
          const DeliverDetailsSection(),
          const SizedBox(height: xxxSmallestSpacing)
        ],
      ),
    );
  }
}
