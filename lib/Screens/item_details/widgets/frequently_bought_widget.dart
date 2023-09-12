import 'package:favorite_button/favorite_button.dart';

import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../home/widgets/counter_widget.dart';

class FrequentlyBoughtItems extends StatelessWidget {
  const FrequentlyBoughtItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kSizedBoxFrequent,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              elevation: kContainerElevation,
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(tiniestSpacing),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.width * 0.24,
                            width: MediaQuery.of(context).size.width * 0.23,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadiusSmall)),
                            child: Image.asset('assets/img_2.png',
                                fit: BoxFit.fill)),
                        Align(
                          alignment: Alignment.topRight,
                          child: FavoriteButton(
                            valueChanged: () {},
                            iconSize: kFavouriteButton,
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: leftRightMargin, vertical: xxTiniestSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: kGeneralBox,
                        child: Text(
                          'Lays American Style Creame and Onion Potato Chips ',
                          style: Theme.of(context)
                              .textTheme
                              .xTinier
                              .copyWith(fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: xxxTiniestSpacing,
                      ),
                      Text('₹249.00',
                          style: Theme.of(context)
                              .textTheme
                              .tinier
                              .copyWith(fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          Text('₹498',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxxTinier
                                  .copyWith(
                                      color: AppColor.grey,
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(
                            width: tiniestSpacing,
                          ),
                          Container(
                              width: kContainerWidth,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primary),
                                  color: AppColor.primaryLight,
                                  borderRadius:
                                      BorderRadius.circular(kBorderDiscount)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: xxxTiniestSpacing,
                                  horizontal: xxxTiniestSpacing),
                              child: Center(
                                  child: Text('50 % off',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxxTiniest
                                          .copyWith(
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.w500))))
                        ],
                      ),
                      const SizedBox(height: tinierSpacing),
                      const CounterScreen(width: kGeneralBox)
                    ],
                  ),
                )
              ]),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: tiniestSpacing,
            );
          },
        ));
  }
}
