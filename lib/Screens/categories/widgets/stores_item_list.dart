import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class StoreItemList extends StatelessWidget {
  const StoreItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        if (index == 3) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primary,
                  size: 20,
                ),
                icon: Text(
                  'SEE MORE',
                  style: Theme.of(context)
                      .textTheme
                      .textLarge
                      .copyWith(color: AppColor.primary),
                ),
              )
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.24,
              width: MediaQuery.of(context).size.width * 0.24,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/img_2.png'))),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                children: [
                  Text(
                    'Lays American Style Creame and Onion Potato Chips',
                    style: Theme.of(context).textTheme.textLarge,
                  ),
                  const SizedBox(
                    height: xxxTiniestSpacing,
                  ),
                  const Row(
                    children: [
                      Text(
                        '196 GM',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primary),
                      ),
                      SizedBox(
                        width: xxxTiniestSpacing,
                      ),
                      Center(
                          heightFactor: 0.7,
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColor.primary,
                            size: 23,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: xxTinierSpacing,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '₹300',
                            style: Theme.of(context).textTheme.headingSmall,
                          ),
                          const SizedBox(
                            width: xxxTinierSpacing,
                          ),
                          Text(
                            '₹300',
                            style: Theme.of(context)
                                .textTheme
                                .subHeadingLarge
                                .copyWith(
                                    decoration: TextDecoration.lineThrough),
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
                                horizontal: xxTinierSpacing),
                            child: Center(
                              child: Text('40% OFF',
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
                              horizontal: xxTinierSpacing,
                              vertical: xxTiniestSpacing),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: AppColor.primary,
                        ),
                        child: Text('ADD',
                            style: Theme.of(context).textTheme.textButtonLarge),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: xxxSmallSpacing,
        );
      },
    );
  }
}
