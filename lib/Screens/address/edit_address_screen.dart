import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';

class EditAddressScreen extends StatelessWidget {
  static const routeName = 'EditAddressScreen';
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My addresses',
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
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(
          children: [
            const TextField(),
            Row(
              children: [
                SizedBox(width: (MediaQuery.of(context).size.width-(2*leftRightMargin)-xxxTinierSpacing)/2,
                  child: const TextField(
                    decoration: InputDecoration(
                    ),
                  ),
                ),
                const SizedBox(width: xxxTinierSpacing),
                SizedBox(width: (MediaQuery.of(context).size.width-(2*leftRightMargin)-xxxTinierSpacing)/2,
                  child: const TextField(
                    decoration: InputDecoration(
                    ),
                  ),
                ),
                // TextField(),
              ],
            ),
            const TextField(),
            const TextField(),
            Row(
              children: [
                ElevatedButton(onPressed: (){}, child: const Text('Save')),
                ElevatedButton(onPressed: (){}, child: const Text('Cancel'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
