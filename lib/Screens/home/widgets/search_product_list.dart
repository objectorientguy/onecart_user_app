import 'package:flutter/material.dart';

import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/search_product/search_product_model.dart';
import '../../item_details/item_details_screen.dart';

class SearchProductList extends StatelessWidget {
  final List<SearchResult> data;

  const SearchProductList(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: screenwidth * 0.24,
                    width: screenwidth * 0.20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data[index].image![0]),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenwidth * 0.65,
                        child: Text(
                          data[index].productName!,
                          style: Theme.of(context).textTheme.textLarger,
                        ),
                      ),
                      const SizedBox(
                        height: tiniestSpacing,
                      ),
                      SizedBox(
                        width: screenwidth * 0.65,
                        child: Text(
                          data[index].details!,
                          style: Theme.of(context).textTheme.subHeadingMedium,
                        ),
                      ),
                      const SizedBox(
                        height: xxxTinierSpacing,
                      ),
                      SizedBox(
                        width: screenwidth * 0.65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '₹ ${data[index].discountedCost!.toString()}',
                                  style: Theme.of(context).textTheme.textMedium,
                                ),
                                const SizedBox(
                                  width: xxxTinierSpacing,
                                ),
                                Text(
                                  data[index].price!.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subHeadingSmall
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
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: xxTiniestSpacing,
                                      horizontal: xxxTinierSpacing),
                                  child: Center(
                                    child: Text(
                                        '${data[index].discount!} % off',
                                        style: Theme.of(context)
                                            .textTheme
                                            .textSmall
                                            .copyWith(
                                                color: AppColor.primary,
                                                fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: xxxTinySpacing,
                                    vertical: xxTinierSpacing),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                      ),
                    ],
                  )
                ],
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
