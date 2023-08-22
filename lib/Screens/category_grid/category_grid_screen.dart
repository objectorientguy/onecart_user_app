import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/categories_bloc/categories_bloc.dart';
import '../../blocs/categories_bloc/categories_events.dart';
import '../../blocs/categories_bloc/categories_states.dart';
import '../../common_widgets/address_bar.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

import '../categories/category_item_screen.dart';

class CategoryGridScreen extends StatelessWidget {
  const CategoryGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetAllCategoriesBloc>().add(GetAllCategories());

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: Column(
              children: [
                const AddressBar(),
                const SizedBox(
                  height: xxxSmallerSpacing,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Search products...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSearchBarRadius),
                      borderSide: const BorderSide(),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<GetAllCategoriesBloc, CategoriesStates>(
            builder: (context, state) {
              if (state is GetAllCategoriesLoading) {
                return const Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              } else if (state is GetAllCategoriesLoaded) {
                return Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 0.9),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.getAllCategoriesListModel.data!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: kHorizontalCategoryListItemWidth,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CategoryItemScreen.routeName,
                                  arguments: false);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: kHorizontalCategoryListItemWidth,
                                  width: kHorizontalCategoryListItemWidth,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(state
                                            .getAllCategoriesListModel
                                            .data![index]
                                            .categoryImage!)),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: xxxTinierSpacing),
                                SizedBox(
                                  width: kHorizontalCategoryListItemWidth * 1.3,
                                  child: Text(
                                    state.getAllCategoriesListModel.data![index]
                                        .categoryName
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
              if (state is GetAllCategoriesError) {
                return Container();
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
