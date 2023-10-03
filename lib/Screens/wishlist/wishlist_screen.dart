import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/wishlist/widgets/gridview_widget.dart';
import 'package:onecart_user_app/Screens/wishlist/widgets/horizontal_wishlist_category.dart';
import 'package:onecart_user_app/Screens/wishlist/widgets/list_view_widget.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../blocs/wishlist_bloc/wishlist_events.dart';
import '../../blocs/wishlist_bloc/wishlist_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class WishlistScreen extends StatefulWidget {
  static const routeName = 'WishlistScreen';

  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isListView = true;

  void toggleView() {
    setState(() {
      isListView = !isListView;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<WishlistBloc>().add(GetAllWishlistItems());

    return Scaffold(
      appBar: GenericAppBar(
        title: 'WishList',
        actions: [
          IconButton(
            color: AppColor.primary,
            onPressed: () {
              toggleView();
            },
            icon: Icon(isListView ? Icons.grid_view : Icons.list),
          )
        ],
      ),
      body:
          BlocBuilder<WishlistBloc, WishlistStates>(builder: (context, state) {
        if (state is GetAllWishListItemsLoading) {
          return const Column(
            children: [
              SizedBox(
                height: kCircularBox,
              ),
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (state is GetAllWishlistItemsLoaded) {
          if (state.wishlistModel.data.all.isNotEmpty) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: leftRightMargin, vertical: topBottomPadding),
                child: Column(children: [
                  WishlistCategory(
                      wishlistCategory: state.wishlistModel.data.categories),
                  const SizedBox(
                    height: xxxSmallestSpacing,
                  ),
                  Expanded(
                    child: isListView
                        ? ListViewScreen(wishlistData: state.wishlistModel.data)
                        : GridViewScreen(
                            wishlistData: state.wishlistModel.data),
                  )
                ]));
          } else {
            return Center(
                child: Column(
              children: [
                const SizedBox(height: kEmptyBox),
                Image.asset('assets/empty_icon.png'),
                Text(
                  'Sorry! No Products found',
                  style: Theme.of(context).textTheme.xTinier.copyWith(
                      color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
                ),
              ],
            ));
          }
        }
        if (state is GetAllWishListItemsError) {
          return Container();
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
