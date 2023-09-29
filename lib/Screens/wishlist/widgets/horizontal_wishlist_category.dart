
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../../blocs/wishlist_bloc/wishlist_events.dart';
import '../../../blocs/wishlist_bloc/wishlist_states.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class WishlistCategory extends StatelessWidget {
  const WishlistCategory({super.key, });

  @override
  Widget build(BuildContext context) {
    context.read<WishlistBloc>().add(GetWishlistCategory());


    return BlocBuilder<WishlistBloc, WishlistStates>(
        builder: (context, state) {
          if (state is GetWishlistCategoryLoading) {
            return const Column(
              children: [
                SizedBox(
                  height: kCircularBox,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            );
          } else if (state is GetWishlistCategoryLoaded) {
            if (state.wishlistCategoryModel.data.isNotEmpty) {
              return SizedBox(
                height: kImage,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: state.wishlistCategoryModel.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primary),
                          borderRadius: BorderRadius.circular(kEditRadius)),
                      padding: const EdgeInsets.symmetric(
                          vertical: tiniestSpacing,
                          horizontal: xxxSmallestSpacing),
                      child: Text(state.wishlistCategoryModel.data[index].categoryName),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: tiniestSpacing,
                    );
                  },
                ),
              );
            }else{
              return const SizedBox();
            }
          }
          if (state is GetWishlistCategoryError) {
            return Container();
          } else {
            return const SizedBox();
          }
        });
  }
}