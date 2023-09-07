import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/get_product/get_product_model.dart';

class CategoryItemScreenHeader extends StatelessWidget {
  final CategoryHeader categoryData;

  const CategoryItemScreenHeader({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.solid,
              color: AppColor.lightGrey,
              spreadRadius: kZero,
              blurRadius: kShadowBlurRadius)
        ]),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(
                leftRightMargin, 0, leftRightMargin, leftRightMargin),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(categoryData.categoryName!,
                      style: Theme.of(context).textTheme.headingSmall)),
              const SizedBox(height: xxTinierSpacing),
              Row(children: [
                Container(
                    width: screenWidth * 0.40,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.primary,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: screenWidth * 0.30,
                              height: 35,
                              child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: tiniestSpacing,
                                      top: tiniestSpacing),
                                  child: Text("Exotic fruits and vegetable",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)))),
                          const Icon(Icons.keyboard_arrow_down_sharp,
                              color: AppColor.primary)
                        ])),
                SizedBox(width: screenWidth * 0.05),
                Container(
                    width: screenWidth * 0.2,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.primary,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text("Filters",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w500)))),
                SizedBox(width: screenWidth * 0.05),
                InkWell(
                    child: Container(
                  width: screenWidth * 0.2,
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColor.primary,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Price",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w500)),
                        Icon(Icons.arrow_downward_outlined,
                            color: AppColor.primary, size: 20)
                      ]),
                ))
              ])
            ])));
  }
}
