import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/categories_bloc/categories_bloc.dart';
import '../../../blocs/categories_bloc/categories_events.dart';
import '../../../blocs/categories_bloc/categories_states.dart';
import '../../../blocs/get_product_bloc/get_product_bloc.dart';
import '../../../blocs/get_product_bloc/get_product_events.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../wishlist_screen.dart';

class WishlistCategory extends StatelessWidget {
  // final List wishlistData;

  const WishlistCategory({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetAllCategoriesBloc>().add(GetAllCategories());
    return BlocBuilder<GetAllCategoriesBloc, CategoriesStates>(
        builder: (context, state) {
      if (state is GetAllCategoriesLoading) {
        return const Column(
          children: [
            SizedBox(
              height: 200,
            ),
          ],
        );
      } else if (state is GetAllCategoriesLoaded) {
        return SizedBox(
            height: kImage,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.getAllCategoriesListModel.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        context.read<GetProductBloc>().add(FetchProduct(
                            cateId: state.getAllCategoriesListModel.data[index]
                                .categoryId!));
                        Navigator.pushReplacementNamed(
                            context, WishlistScreen.routeName);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primary),
                              borderRadius: BorderRadius.circular(kEditRadius)),
                          padding: const EdgeInsets.symmetric(
                              vertical: tiniestSpacing,
                              horizontal: xxxSmallestSpacing),
                          child: Text(state.getAllCategoriesListModel
                              .data[index].categoryName
                              .toString())));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: tiniestSpacing);
                }));
      }
      if (state is GetAllCategoriesError) {
        return Container();
      } else {
        return const SizedBox();
      }
    });
  }
}
