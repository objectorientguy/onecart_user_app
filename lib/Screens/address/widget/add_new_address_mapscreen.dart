import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/address/add_address_screen.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/search_text_field.dart';

class AddAddressMapScreen extends StatelessWidget {
  static const routeName = 'AddAddressMapScreen';

  const AddAddressMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: GestureDetector(child: AddAddressScreen()),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/Zomato Map.jpg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(tinierSpacing),
            child: SearchTextField(
                hintText: 'Search for area,street name..',
                hintStyle: Theme.of(context)
                    .textTheme
                    .xxxTinier
                    .copyWith(fontWeight: FontWeight.w300),
                prefixicon: const Icon(
                  Icons.search,
                  color: AppColor.primary,
                ),
                textcontroller: myController),
          ),
        ],
      ),
    );
  }
}
