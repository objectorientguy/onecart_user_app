import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import 'package:onecart_user_app/data/models/varient/select_varient_model.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class SelectVarientBody extends StatelessWidget {
  final SelectVarientListModel selectVarientListModel;

  const SelectVarientBody({super.key, required this.selectVarientListModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: selectVarientListModel.data!.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: tinySpacing),
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: xxTinierSpacing, vertical: xxTinierSpacing),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(
                          color: AppColor.lightestGrey, width: kBorderWidth),
                      borderRadius: BorderRadius.circular(kAddRadius)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  selectVarientListModel.data![index].weight
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxxTinier
                                      .copyWith(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w600)),
                              const SizedBox(height: xxxTiniestSpacing),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '₹${selectVarientListModel.data![index].discountedCost.toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxxTinier
                                          .copyWith(
                                              color: AppColor.darkestGrey,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: xxxTinierSpacing),
                                    Text(
                                        '₹${selectVarientListModel.data![index].variantPrice.toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .tiniest
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.darkestGrey)),
                                    const SizedBox(width: xxxTinierSpacing),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColor.primary,
                                              width: kBorderWidth,
                                            ),
                                            color: AppColor.lightestwhite,
                                            borderRadius: BorderRadius.circular(
                                                kDiscountRadius)),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: xxxTiniestSpacing,
                                            horizontal: xxxTinierSpacing),
                                        child: Center(
                                            child: Text(
                                                '${selectVarientListModel.data![index].discount.toString()} OFF',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColor.primary))))
                                  ]),
                            ]),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                                horizontal: xxxTinySpacing,
                                vertical: tiniestSpacing),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kAddRadius)),
                            backgroundColor: AppColor.primary,
                          ),
                          child: Text('SELECT',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTinier
                                  .copyWith(color: AppColor.white)),
                        )
                      ]));
            }));
  }
}
