import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/ratings/widgets/ratings_list_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../blocs/ratings_bloc/ratings_bloc.dart';
import '../../../blocs/ratings_bloc/ratings_events.dart';
import '../../../blocs/ratings_bloc/ratings_states.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class PeoplesReviews extends StatelessWidget {
  const PeoplesReviews({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    context.read<RatingsBloc>().add(GetAllRatings(productId: productId));
    return Scaffold(
      body: BlocBuilder<RatingsBloc, RatingsStates>(
          buildWhen: (previousState, currentState) =>
              currentState is GetAllRatingsLoading ||
              currentState is GetAllRatingsLoaded ||
              currentState is GetAllRatingsError,
          builder: (context, state) {
            if (state is GetAllRatingsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllRatingsLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: topBottomPadding, horizontal: leftRightMargin),
                child: Column(
                  children: [
                    Text(
                      "People’s Rating and Reviews to this product",
                      style: Theme.of(context).textTheme.xTinier.copyWith(
                          color: AppColor.mediumBlack,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: xxTinySpacing,
                    ),
                    RatingsListWidget(
                      ratingsDetails: state.viewRatingsModel.data,
                    ),
                  ],
                ),
              );
            }
            if (state is GetAllRatingsError) {
              return Container();
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
