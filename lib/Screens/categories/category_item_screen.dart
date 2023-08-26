import 'package:flutter/material.dart';

import 'package:onecart_user_app/Screens/categories/widgets/category_screen_header.dart';
import 'package:onecart_user_app/Screens/categories/widgets/stores_item_list.dart';

import '../../common_widgets/generic_app_bar.dart';
import '../../data/models/home/home_model.dart';

class CategoryItemScreen extends StatelessWidget {
  static const routeName = 'CategoryItemScreen';
  final Category categoryDeals;

  const CategoryItemScreen({Key? key, required this.categoryDeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.read<GetAllCategoriesBloc>().add(FetchItemDetails());
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
