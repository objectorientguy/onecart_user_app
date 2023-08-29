import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onecart_user_app/Screens/home/widgets/horizontal_category_list.dart';
import 'package:onecart_user_app/Screens/home/widgets/search_screen.dart';
import 'package:onecart_user_app/Screens/home/widgets/todays_deals_section.dart';
import 'package:onecart_user_app/common_widgets/address_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_events.dart';
import '../../blocs/home/home_states.dart';
import '../../blocs/search_product_bloc/search_product_bloc.dart';
import '../../blocs/search_product_bloc/search_product_events.dart';
import '../../common_widgets/carousel_slider.dart';
import '../../configs/app_dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    context.read<GetHomeDetailsBloc>().add(GetHomeDetails());
    return SafeArea(
      child: BlocBuilder<GetHomeDetailsBloc, HomeStates>(
        builder: (context, state) {
          if (state is GetHomeDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetHomeDetailsLoaded) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: leftRightMargin,
                        vertical: topBottomPadding),
                    child: Column(
                      children: [

                        const AddressBar(),
                        const SizedBox(
                          height: xxxSmallerSpacing,
                        ),
                        TextField(
                          controller: myController,
                          decoration: InputDecoration(
                            hintText: 'Search products...',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kSearchBarRadius),
                              borderSide: const BorderSide(),
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  context.read<SearchProductsBloc>().add(SearchAllProducts(searchTerm: myController.text));
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchScreen()));
                                },
                                child: const Icon(Icons.search)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalCategoryList(
                    data: state.homeModel.data!.categories!,
                  ),
                  const SizedBox(
                    height: tiniestSpacing,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.width * 0.55,
                      child: CarouselSlider(
                        state.homeModel.data!.banners!,
                      )),
                  TodayDealsSection(state.homeModel.data!.deals!),
                ],
              ),
            );
          }
          if (state is GetHomeDetailsError) {
            return Container();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
