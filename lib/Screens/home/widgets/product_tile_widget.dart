import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({
    super.key,
    required this.screenwidth,
    required this.data,
    required this.index,
  });

  final double screenwidth;
  final List<Deal> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: xxTiniestSpacing),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.24,
              width: MediaQuery.of(context).size.width * 0.28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(data[index].image![0].toString()))),
            ),
          ),
        ),
        const SizedBox(
          width: xxxTinierSpacing,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenwidth * 0.65,
                child: Text(
                  data[index].productName!,
                  style: Theme.of(context)
                      .textTheme
                      .headingTiny
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: tiniestSpacing,
              ),
              SizedBox(
                width: screenwidth * 0.65,
                child: Text(
                  data[index].details!,
                  style: Theme.of(context).textTheme.xxGSmall,
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                height: xxxTinierSpacing,
              ),
              SizedBox(
                width: screenwidth * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '₹ ${data[index].discountedCost!.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .textMediumx
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.black),
                        ),
                        const SizedBox(
                          width: tiniestSpacing,
                        ),
                        Text(
                          '₹ ${data[index].price!.toString()}',
                          style: Theme.of(context).textTheme.xxGSmall.copyWith(
                              color: AppColor.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const SizedBox(
                          width: tiniestSpacing,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.grey,
                              ),
                              color: AppColor.primaryLight,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              vertical: xxTiniestSpacing,
                              horizontal: xxxTinierSpacing),
                          child: Center(
                            child: Text('${data[index].discount!} % off',
                                style: Theme.of(context)
                                    .textTheme
                                    .xxxSmall
                                    .copyWith(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(width: xxxTinierSpacing,),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                            horizontal: tinierSpacing,
                            vertical: tiniestSpacing),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: AppColor.primary,
                      ),
                      child: Text('ADD',
                          style: Theme.of(context)
                              .textTheme
                              .xxGSmall
                              .copyWith(color: AppColor.white)),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
