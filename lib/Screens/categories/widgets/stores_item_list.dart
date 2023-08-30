import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/get_product/get_product_model.dart';
import '../../item_details/item_details_screen.dart';

class StoreItemList extends StatelessWidget {
  final List<CategoryProductDatum> storedata;

  const StoreItemList({
    super.key,
    required this.storedata,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.24,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      storedata[index].image![0].toString()))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storedata[index].productName.toString(),
                            style: Theme.of(context).textTheme.textLarge,
                          ),
                          const SizedBox(
                            height: xxxTinierSpacing,
                          ),
                          Text(
                            storedata[index].details.toString(),
                            style: Theme.of(context).textTheme.textMediumx,
                          ),
                          const SizedBox(
                            height: xxxTinySpacing,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '₹${storedata[index].discountedCost!.toString()}',
                                    style:
                                        Theme.of(context).textTheme.headingTiny,
                                  ),
                                  const SizedBox(
                                    width: tiniestSpacing,
                                  ),
                                  Text(
                                    '₹${storedata[index].price!.toString()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subHeadingMedium
                                        .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                  const SizedBox(
                                    width: xxxTinierSpacing,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.grey,
                                        ),
                                        color: AppColor.primaryLight,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: xxTiniestSpacing,
                                        horizontal: xxTinierSpacing),
                                    child: Center(
                                      child: Text(
                                          '${storedata[index].discount!} % off',
                                          style: Theme.of(context)
                                              .textTheme
                                              .textSmall
                                              .copyWith(
                                                  color: AppColor.primary,
                                                  fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: xxTinySpacing,
                                      vertical: xxTinierSpacing),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: AppColor.primary,
                                ),
                                child: Text('ADD',
                                    style: Theme.of(context)
                                        .textTheme
                                        .textButtonLarge),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              if (index == 0 || index == 7) {
                return const SizedBox(
                  height: smallSpacing,
                );
              }
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
