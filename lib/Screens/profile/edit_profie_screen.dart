import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: leftRightMargin,vertical: topBottomPadding),
        child: Column(
          children: [
            Text('Profile Information',style:Theme.of(context).textTheme.headingMedium),
            SizedBox(height: smallSpacing,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
