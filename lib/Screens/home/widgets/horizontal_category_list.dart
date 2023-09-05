import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_bloc.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_events.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../categories/category_item_screen.dart';

class HorizontalCategoryList extends StatelessWidget {
  static const routeName = 'HorizontalCategoryList';
  final List<dynamic> data;

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
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
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
                      color: AppColor.mediumlightestGrey,
                      image: DecorationImage(
                          // fit: BoxFit.scaleDown,
                          image: NetworkImage(
                              data[index].categoryImage!,
                          )),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: tiniestSpacing,),
                  SizedBox(
                    width: kHorizontalCategoryListItemWidth * 1.2,
                    child: Text(
                      data[index].categoryName!.toString().toUpperCase(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.categoryText,

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
