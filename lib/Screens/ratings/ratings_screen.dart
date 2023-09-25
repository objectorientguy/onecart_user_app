import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/ratings/widgets/ratings_list_widget.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../blocs/ratings_bloc/ratings_bloc.dart';
import '../../blocs/ratings_bloc/ratings_events.dart';
import '../../blocs/ratings_bloc/ratings_states.dart';
import '../../common_widgets/button_widget.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../widgets/text_field_widget.dart';
import '../item_details/widgets/star_widget.dart';

class AddRatingsScreen extends StatelessWidget {
  const AddRatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RatingsBloc>().add(GetAllRatings());

    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Ratings and Reviews',
      ),
      body: BlocBuilder<RatingsBloc, RatingsStates>(builder: (context, state) {
        if (state is GetAllRatingsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllRatingsLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Add Rating",
                style: Theme.of(context).textTheme.xTinier.copyWith(
                    color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: tinierSpacing,
              ),
              StarDisplayWidget(
                  filledStar: const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: kRatingIconBig,
                  ),
                  unfilledStar: const Icon(
                    Icons.star_rounded,
                    color: AppColor.lighterGrey,
                    size: kRatingIconBig,
                  ),
                  halfFilledStar: const Icon(
                    Icons.star_half_rounded,
                    color: Colors.amber,
                    size: kRatingIconBig,
                  ),
                  value: state.viewRatingsModel.data[0].rating.toDouble()),
              const SizedBox(
                height: tinierSpacing,
              ),
              Text(
                "Add Review",
                style: Theme.of(context).textTheme.xTinier.copyWith(
                    color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: tinierSpacing,
              ),
              TextFieldWidget(
                onTextFieldChanged: (String reviewText) {},
                maxLines: 5,
                hintText: 'Type here...',
                hintStyle: Theme.of(context).textTheme.xxTinier.copyWith(
                    color: AppColor.grey,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
                filled: true,
                fillColor: AppColor.primaryLight,
              ),
              const SizedBox(
                height: tinierSpacing,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    title: 'Cancel',
                    isFromCancel: true,
                  ),
                  ButtonWidget(
                    isToBePosted: true,
                    title: 'Post',
                  ),
                ],
              ),
              const SizedBox(
                height: xxTinySpacing,
              ),
              Text(
                "People’s Rating and Reviews to this product",
                style: Theme.of(context).textTheme.xTinier.copyWith(
                    color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: xxTinySpacing,
              ),
              RatingsListWidget(
                ratingsDetails: state.viewRatingsModel.data,
              ),
            ]),
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
