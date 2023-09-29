import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/home/widgets/horizontal_category_list.dart';
import 'package:onecart_user_app/Screens/home/widgets/search_screen.dart';
import 'package:onecart_user_app/Screens/address/widget/address_bar.dart';
import 'package:onecart_user_app/Screens/home/widgets/todays_deals_section.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_events.dart';
import '../../blocs/home/home_states.dart';
import '../../blocs/search_product_bloc/search_product_bloc.dart';
import '../../blocs/search_product_bloc/search_product_events.dart';
import '../../common_widgets/address_bottom_sheet.dart';
import '../../common_widgets/carousel_slider.dart';
import '../../configs/app_dimensions.dart';
import '../../widgets/search_text_field.dart';
import '../shops/shops_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    context.read<GetHomeDetailsBloc>().add(GetHomeDetails());
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: BlocBuilder<GetHomeDetailsBloc, HomeStates>(
          builder: (context, state) {
            if (state is GetHomeDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetHomeDetailsLoaded) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: topBottomPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: leftRightMargin),
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      isDismissible: true,
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight:
                                                  Radius.circular(smallCardCurve),
                                              topLeft: Radius.circular(
                                                  smallCardCurve))),
                                      builder: (BuildContext context) {
                                        return const AddressBottomSheet();
                                      });
                                },
                                child: const AddressBar()),
                            const SizedBox(
                              height: xxxSmallerSpacing,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Haldiram's",
                                  style: Theme.of(context)
                                      .textTheme
                                      .xTiny
                                      .copyWith(
                                          color: AppColor.mediumBlack,
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: tiniestSpacing,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectShops()));
                                  },
                                  child: Text(
                                    "(Change Shop)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .xTinier
                                        .copyWith(
                                          color: AppColor.primary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: xxxSmallerSpacing,
                            ),
                            SearchTextField(
                              hintText: "Search for groceries",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .xTinier
                                  .copyWith(fontWeight: FontWeight.w300),
                              textcontroller: myController,
                              prefixicon: InkWell(
                                  onTap: () {
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    if (myController.text.isNotEmpty) {
                                      context.read<SearchProductsBloc>().add(
                                          SearchAllProducts(
                                              searchTerm: myController.text));
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchScreen()));
                                    }
                                  },
                                  child: const Icon(Icons.search_sharp)),
                            ),
                            const SizedBox(
                              height: tinySpacing,
                            ),
                            HorizontalCategoryList(
                              data: state.homeModel.data.categories,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: smallestSpacing),
                        child: Text(
                          "Popular Shops",
                          style: Theme.of(context).textTheme.xTinier.copyWith(
                              color: AppColor.mediumBlack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: xxxSmallestSpacing,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.55,
                          child: CarouselSlider(
                            state.homeModel.data.popularShops,
                          )),
                      const SizedBox(
                        height: smallestSpacing,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: leftRightMargin,
                            vertical: topBottomPadding),
                        child:
                            TodayDealsSection(state.homeModel.data.todaySDeals),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
