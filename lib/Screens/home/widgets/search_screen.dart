import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/home/widgets/horizontal_brand_list.dart';
import 'package:onecart_user_app/Screens/home/widgets/search_product_list.dart';
import 'package:onecart_user_app/blocs/search_product_bloc/search_product_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../blocs/search_product_bloc/search_product_events.dart';
import '../../../blocs/search_product_bloc/search_product_states.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'horizontal_category_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: xxTinierSpacing),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kSearchBarRadius),
                  borderSide: const BorderSide(),
                ),
                suffixIcon:
                    InkWell(onTap: () {
                      context.read<SearchProductsBloc>().add(SearchAllProducts(searchTerm: myController.text));

                    }, child: const Icon(Icons.search)),
              ),
            ),
          ),
          const SizedBox(
            height: xMediumSpacing,
          ),
          BlocBuilder<SearchProductsBloc,SearchProductStates>(
            builder: (context, state) {
              if (state is SearchProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchProductsLoaded) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  const EdgeInsets.symmetric(
                              horizontal: leftRightMargin, vertical: topBottomPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text("Category",style: Theme.of(context).textTheme.headingLarge
                                  ),
                              (state.getSearchProductsList.data!.categories!.isEmpty)?
                               Column(
                                children: [
                                  const SizedBox(height: xxxSmallestSpacing,),
                                  Text("No results Found!",style: Theme.of(context).textTheme.mediumLarge),
                                  const SizedBox(height: xxxLargerSpacing,)
                                ],
                              ):
                              HorizontalCategoryList(
                                  state.getSearchProductsList.data!.categories!
                              ),
                              const SizedBox(
                                height: tiniestSpacing,
                              ),
                               Text("Brands",style: Theme.of(context).textTheme.headingLarge),
                              (state.getSearchProductsList.data!.brands!.isEmpty)? Column(
                                children: [
                                  const SizedBox(height: xxxSmallestSpacing,),
                                  Text("No brands found!",style: Theme.of(context).textTheme.mediumLarge),
                                  const SizedBox(height: xxxLargerSpacing,)
                                ],
                              ):HorizontalBrandList(state.getSearchProductsList.data!.brands!),
                               Text(
                                "Product's",
                                style: Theme.of(context).textTheme.headingLarge,
                              ),
                              (state.getSearchProductsList.data!.searchResults!.isEmpty)? Column(
                                children: [
                                  const SizedBox(height: xxxSmallestSpacing,),
                                  Text("No Products Found!",style: Theme.of(context).textTheme.mediumLarge),
                                ],
                              ):SearchProductList(state.getSearchProductsList.data!.searchResults!)
                            ],
                          ),
                        ),

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
    );
  }
}
