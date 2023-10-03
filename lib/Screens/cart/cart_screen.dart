import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_bottom_bar.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_header.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_item_list.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../blocs/view_cart_bloc/view_cart_bloc.dart';
import '../../blocs/view_cart_bloc/view_cart_events.dart';
import '../../blocs/view_cart_bloc/view_cart_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'CartScreen';

  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetAllCartItemsBloc>().add(GetAllCartItems());
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Your Cart',
      ),
      bottomNavigationBar: BlocBuilder<GetAllCartItemsBloc, ViewCartStates>(
          builder: (context, state) {
        if (state is GetAllCartItemsLoaded) {
          if (state.viewCartModel.data.cartItemCount != 0) {
            return const CartBottomBar();
          } else {
            return const SizedBox();
          }
        } else {
          return const SizedBox();
        }
      }),
      body: BlocBuilder<GetAllCartItemsBloc, ViewCartStates>(
          buildWhen: (pre, curr) =>
              (curr is GetAllCartItemsLoaded || curr is GetAllCartItemsLoading),
          builder: (context, state) {
            if (state is GetAllCartItemsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllCartItemsLoaded) {
              if (state.viewCartModel.data.cartItemCount != 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: leftRightMargin, vertical: xxxTinierSpacing),
                  child: Column(children: [
                    CartHeader(
                      cartDetails: state.viewCartModel.data,
                    ),
                    const SizedBox(
                      height: xxxSmallestSpacing,
                    ),
                    CartItemList(
                      cartDetails: state.viewCartModel.data.cartItems,
                    )
                  ]),
                );
              } else {
                return Center(
                    child: Column(
                  children: [
                    const SizedBox(height: kSuccessImageHeight),
                    Image.asset('assets/empty_icon.png'),
                    Text(
                      'Sorry! No Products found in your Cart',
                      style: Theme.of(context).textTheme.xTinier.copyWith(
                          color: AppColor.mediumBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ));
              }
            }
            if (state is GetAllCartItemsError) {
              return Container();
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
