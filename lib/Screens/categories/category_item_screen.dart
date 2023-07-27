import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/categories/widgets/category_screen_header.dart';
import 'package:onecart_user_app/Screens/categories/widgets/store_list.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

class CategoryItemScreen extends StatelessWidget {
  static const routeName = 'CategoryItemScreen';
  const CategoryItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        titleSpacing: xxxTiniestSpacing,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryItemScreenHeader(),
          Expanded(
            child: StoreList(),
          ),
        ],
      ),
    );
  }
}
