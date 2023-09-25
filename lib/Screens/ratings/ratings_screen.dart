import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

class AddRatingsScreen extends StatelessWidget {
  int postRating;

  AddRatingsScreen({super.key, this.postRating = 0});

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
              RatingBar.builder(
                itemSize: kRatingIconBig,
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  postRating = rating.toInt();
                  log(postRating.toString());
                },
                maxRating: 1,
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Cancel',
                  ),
                  ButtonWidget(
                    onPressed: () {
                      context.read<RatingsBloc>().add(AddRatings(
                            rating: postRating,
                            reviewText: '',
                          ));
                    },
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
