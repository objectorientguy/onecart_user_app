import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';

class EditFieldScreen extends StatelessWidget {
  static const routeName = 'EditFieldScreen';
  final String fieldData;
  const EditFieldScreen({Key? key, required this.fieldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fieldController = TextEditingController();

    fieldController.value = TextEditingValue(text: fieldData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit', style: Theme.of(context).textTheme.headingMedium),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: leftRightMargin, vertical: topBottomPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Edit Information',
                  style: Theme.of(context).textTheme.headingMedium),
              const SizedBox(height: smallestSpacing),
              TextField(
                controller: fieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: xxxTinierSpacing),
              CustomElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'SAVE',
                    style: Theme.of(context).textTheme.textButtonLarger,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
