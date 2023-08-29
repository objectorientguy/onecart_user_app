import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_bloc.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_events.dart';
import 'package:onecart_user_app/data/models/home/home_model.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../categories/category_item_screen.dart';

class HorizontalCategoryList extends StatelessWidget {
  static const routeName = 'HorizontalCategoryList';
  final List<Category> data;

  const HorizontalCategoryList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHorizontalCategoryListHeight,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: kHorizontalCategoryListItemWidth * 1.2,
            child: InkWell(
              onTap: () {
                context
                    .read<GetProductBloc>()
                    .add(FetchProduct(cateId: data[index].categoryId!));
                Navigator.pushNamed(context, CategoryItemScreen.routeName,
                    arguments: data[index]);
              },
              child: Column(
                children: [
                  Container(
                    height: kHorizontalCategoryListItemWidth,
                    width: kHorizontalCategoryListItemWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data[index].categoryImage!)),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: kHorizontalCategoryListItemWidth * 1.2,
                    child: Text(
                      data[index].categoryName!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: tiniestSpacing,
          );
        },
      ),
    );
  }
}
