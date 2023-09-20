import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_bottom_bar.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_header.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_item_list.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

import '../../blocs/view_cart_bloc/view_cart_bloc.dart';
import '../../blocs/view_cart_bloc/view_cart_events.dart';
import '../../blocs/view_cart_bloc/view_cart_states.dart';

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
      bottomNavigationBar: const CartBottomBar(),
      body: BlocBuilder<GetAllCartItemsBloc, ViewCartStates>(
          builder: (context, state) {
        if (state is GetAllCartItemsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllCartItemsLoaded) {
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
