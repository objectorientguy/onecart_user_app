import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class DeliveryDetailsSection extends StatelessWidget {
  const DeliveryDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: leftRightMargin,vertical: topBottomPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deliver To',style:Theme.of(context).textTheme.subHeadingLarge),
          const SizedBox(height: tinierSpacing,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColor.primary,
                    size: kLocationIconSize,
                  ),
                  const SizedBox(
                    width: xxTiniestSpacing,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Home',
                              style: Theme.of(context)
                                  .textTheme
                                  .headingTiny),
                          const SizedBox(
                            width: xxxTiniestSpacing,
                          ),
                          const Center(
                              heightFactor: kLocationIconHeightFactor,
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColor.primary,
                                size: kLocationIconSize,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: xxTiniestSpacing,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          'Akshya Nagar 1st Block 1st Cross, Ramamurthy Nagar, Nagpur-440009',
                          style: Theme.of(context)
                              .textTheme
                              .subHeadingMedium,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'CHANGE',
                    style:
                    TextStyle(color: AppColor.primary, fontSize: 14),
                  )),
            ],
          ),
          const Divider(height: smallerSpacing,thickness: 0.3),
          Text('Delivery Partner',style:Theme.of(context).textTheme.subHeadingLarge),
          const SizedBox(height: tinierSpacing,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: tiniestSpacing),
                    child: Container(height: 40,width: 40,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(12),
                          image: const DecorationImage(fit: BoxFit.fitHeight,
                              image: AssetImage('assets/dunzo.png'))),

                    ),
                  ),
                  const SizedBox(
                    width: xxxTinierSpacing,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dunzo',
                          style:
                          Theme.of(context).textTheme.textLarge),
                      const SizedBox(
                        height: xxTiniestSpacing,
                      ),
                      Text(
                        '10-20 mins',
                        style: Theme.of(context)
                            .textTheme
                            .subHeadingMedium,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'CHANGE',
                    style:
                    TextStyle(color: AppColor.primary, fontSize: 14),
                  )),
            ],
          )
        ],
      ),
    );
  }
}