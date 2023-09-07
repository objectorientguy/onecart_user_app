import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/custom_elevated_button.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/search_text_field.dart';

class CurrentLocation extends StatelessWidget {
  static const routeName = 'CurrentLocation';

  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm delivery location",
            style: Theme.of(context)
                .textTheme
                .small
                .copyWith(color: AppColor.black, fontWeight: FontWeight.w600)),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 240,
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.lighterRed,
                      ),
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(kBorderDiscount)),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: xxxTinierSpacing),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.my_location,
                          color: AppColor.lighterRed,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, CurrentLocation.routeName,
                                    arguments: false);
                              },
                              child: Text(
                                'Use Your Current Location',
                                style: Theme.of(context)
                                    .textTheme
                                    .xxSmall
                                    .copyWith(
                                        color: AppColor.lighterRed,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColor.lighterRed,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tatya Tope Nagar, Deo,Nagpur',
                          style: Theme.of(context).textTheme.xmedium.copyWith(
                              color: AppColor.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Deo Nagar, Nagar',
                          style: Theme.of(context)
                              .textTheme
                              .xxGSmall
                              .copyWith(color: AppColor.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(
                  backgroundColor: AppColor.lighterRed,
                  onPressed: () {},
                  buttonWidth: double.maxFinite,
                  buttonHeight: kElevatedButtonHeightSmall,
                  child: const Text("Enter Complete Address"),
                ),
              ],
            ),
          )),
      body: Stack(
        children: [
          Image.asset(
            'assets/map2.jpg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchTextField(
                hintText: 'Search for area,street name..',
                hintStyle: Theme.of(context).textTheme.textSmall,
                prefixicon: const Icon(
                  Icons.search,
                  color: AppColor.red,
                ),
                textcontroller: myController),
          ),
        ],
      ),
    );
  }
}
