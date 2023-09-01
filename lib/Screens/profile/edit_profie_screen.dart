import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../widgets/text_field_widget.dart';
import 'edit_field_screen.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = 'EditProfileScreen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController newPasswordConfirmController =
        TextEditingController();

    nameController.value = const TextEditingValue(text: 'John Doe');
    emailController.value = const TextEditingValue(text: 'johndoe@gmail.com');
    phoneController.value = const TextEditingValue(text: '+91-99999-88888');

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',
            style: Theme.of(context).textTheme.headingMedium),
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
              Text('User Information',
                  style: Theme.of(context).textTheme.headingMedium),
              const SizedBox(height: smallestSpacing),
              TextField(
                controller: nameController,
                readOnly: true,
                decoration: InputDecoration(
                  suffix: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: xxxTinierSpacing),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, EditFieldScreen.routeName,
                              arguments: nameController.text);
                        },
                        child: Text('Edit',
                            style: Theme.of(context)
                                .textTheme
                                .textLarge
                                .copyWith(color: AppColor.primary))),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: xxxTinierSpacing),
              TextField(
                controller: emailController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: xxxTinierSpacing),
              TextField(
                controller: phoneController,
                readOnly: true,
                decoration: InputDecoration(
                  suffix: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: xxxTinierSpacing),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, EditFieldScreen.routeName,
                              arguments: phoneController.text);
                        },
                        child: Text('Edit',
                            style: Theme.of(context)
                                .textTheme
                                .textLarge
                                .copyWith(color: AppColor.primary))),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: smallSpacing),
              Text('Change Password',
                  style: Theme.of(context).textTheme.headingMedium),
              const SizedBox(height: smallestSpacing),
              TextFieldWidget(
                controller: oldPasswordController,
                onTextFieldChanged: (String textField) {},
                hintText: 'Current Password',
              ),
              const SizedBox(height: xxxTinierSpacing),
              TextFieldWidget(
                controller: newPasswordController,
                onTextFieldChanged: (String textField) {},
                hintText: 'New Password',
              ),
              const SizedBox(height: xxxTinierSpacing),
              TextFieldWidget(
                onTextFieldChanged: (String textField) {},
                controller: newPasswordConfirmController,
                hintText: 'Repeat Password',
              ),
              const SizedBox(height: smallSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
