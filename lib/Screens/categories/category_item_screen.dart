import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/categories/widgets/category_screen_header.dart';
import 'package:onecart_user_app/Screens/categories/widgets/stores_item_list.dart';

import '../../common_widgets/generic_app_bar.dart';

class CategoryItemScreen extends StatelessWidget {
  static const routeName = 'CategoryItemScreen';

  const CategoryItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GenericAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryItemScreenHeader(),
          Expanded(
            child: StoreItemList(),
          ),
        ],
      ),
    );
  }
}
