import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/search_text_field.dart';
import 'fetching_current_location.dart';

class CurrentLocation extends StatelessWidget {
  static const routeName = 'CurrentLocation';

  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GenericAppBar(
        title: "Confirm delivery location",
        style: Theme.of(context)
            .textTheme
            .xxTiny
            .copyWith(color: AppColor.black, fontWeight: FontWeight.w400),
      ),
      bottomNavigationBar: const FetchCurrentLocation(),
      body: Stack(
        children: [
          Image.asset(
            'assets/Zomato Map.jpg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(tinierSpacing),
            child: SearchTextField(
                hintText: 'Search for area,street name..',
                hintStyle: Theme.of(context).textTheme.xxxTinier,
                prefixicon: const Icon(
                  Icons.search,
                  color: AppColor.lighterRed,
                ),
                textcontroller: myController),
          ),
        ],
      ),
    );
  }
}
