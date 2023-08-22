import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/common_widgets/address_bar.dart';
import 'package:onecart_user_app/Screens/home/widgets/horizontal_category_list.dart';
import 'package:onecart_user_app/Screens/home/widgets/todays_deals_section.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_events.dart';
import '../../blocs/home/home_states.dart';
import '../../common_widgets/carousel_slider.dart';
import '../../configs/app_dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetHomeDetailsBloc>().add(GetHomeDetails());
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
            BlocBuilder<GetHomeDetailsBloc, HomeStates>(
              builder: (context, state) {
                if (state is GetHomeDetailsLoading) {
                  return const Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (state is GetHomeDetailsLoaded) {
                  return Column(
                    children: [
                      HorizontalCategoryList(
                        state.homeModel.data!.categories!,
                      ),
                      const SizedBox(
                        height: tiniestSpacing,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.55,
                          child: const CarouselSlider()),
                      const TodayDealsSection(),
                      // state.homeModel.data!.deals!,),
                    ],
                  );
                }
                if (state is GetHomeDetailsError) {
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
