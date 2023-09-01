import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/home/widgets/horizontal_brand_list.dart';
import 'package:onecart_user_app/Screens/home/widgets/search_product_list.dart';
import 'package:onecart_user_app/blocs/search_product_bloc/search_product_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../blocs/search_product_bloc/search_product_events.dart';
import '../../../blocs/search_product_bloc/search_product_states.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/search_text_field.dart';
import 'horizontal_category_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(
              hintText: "Search Product's",
              textcontroller: myController,
              suffixicon: InkWell(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    context
                        .read<SearchProductsBloc>()
                        .add(SearchAllProducts(searchTerm: myController.text));
                  },
                  child: const Icon(Icons.search)),
            ),
            const SizedBox(
              height: xMediumSpacing,
            ),
            BlocBuilder<SearchProductsBloc, SearchProductStates>(
              builder: (context, state) {
                if (state is SearchProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchProductsLoaded) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child:
                          (state.getSearchProductsList.data!.brands!.isEmpty &&
                                  state.getSearchProductsList.data!
                                      .searchResults!.isEmpty &&
                                  state.getSearchProductsList.data!.categories!
                                      .isEmpty)
                              ? Center(
                                  child: Text("No results found!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headingMedium))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (state.getSearchProductsList.data!
                                            .categories!.isEmpty)
                                        ? const SizedBox()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Category",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .textLarger),
                                              const SizedBox(
                                                height: xxxSmallestSpacing,
                                              ),
                                              HorizontalCategoryList(
                                                data: state
                                                    .getSearchProductsList
                                                    .data!
                                                    .categories!,
                                              ),
                                              const SizedBox(
                                                height: smallerSpacing,
                                              ),
                                            ],
                                          ),
                                    (state.getSearchProductsList.data!.brands!
                                            .isEmpty)
                                        ? const SizedBox()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Brands",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .textLarger),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              HorizontalBrandList(state
                                                  .getSearchProductsList
                                                  .data!
                                                  .brands!),
                                              const SizedBox(
                                                height: smallerSpacing,
                                              ),
                                            ],
                                          ),
                                    (state.getSearchProductsList.data!
                                            .searchResults!.isEmpty)
                                        ? const SizedBox()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Product's",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .textLarger,
                                              ),
                                              SearchProductList(state
                                                  .getSearchProductsList
                                                  .data!
                                                  .searchResults!)
                                            ],
                                          )
                                  ],
                                ),
                    ),
                  );
                }
                if (state is SearchProductsError) {
                  return Container();
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
