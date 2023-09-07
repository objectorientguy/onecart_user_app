import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/varient/widgets/select_varient_body.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/varient_bloc/varient_bloc.dart';

import '../../blocs/varient_bloc/varient_states.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/item_details/item_details_model.dart';

class SelectVariantScreen extends StatelessWidget {
  static const routeName = 'SelectVariantScreen';
  final ItemDetailsData dataone;

  const SelectVariantScreen({super.key, required this.dataone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.palewhite,
        appBar: GenericAppBar(
            backgroundColor: AppColor.palewhite,
            title: 'Select Varient',
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColor.black,
                ))),
        bottomNavigationBar: BottomAppBar(
            elevation: kZero,
            color: AppColor.palewhite,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: topBottomPadding, horizontal: leftRightMargin),
                child: CustomElevatedButton(
                    onPressed: () {},
                    buttonWidth: double.maxFinite,
                    buttonHeight: kElevatedButtonHeightSmall,
                    child: Text(
                      'DONE',
                      style: Theme.of(context).textTheme.textButtonLarger,
                    )))),
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: BlocBuilder<SelectVarientBloc, SelectVarientStates>(
                builder: (context, state) {
              if (state is GetAllVarientsLoading) {
                return const Column(children: [
                  SizedBox(
                    height: kSizedBoxInfinite,
                  ),
                  Center(child: CircularProgressIndicator()),
                ]);
              } else if (state is GetAllVarientsLoaded) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CachedNetworkImage(
                            imageUrl: dataone.image![0],
                            errorWidget: (context, url, error) => const Center(
                                child: SizedBox(
                                    width: kCacheImageWidth,
                                    child: Text(
                                      'No image',
                                      textAlign: TextAlign.center,
                                    ))),
                            height: xxLargeSpacing),
                        const SizedBox(
                          width: tinierSpacing,
                        ),
                        Flexible(
                            child: Text(dataone.productName.toString(),
                                style: Theme.of(context).textTheme.xmedium))
                      ]),
                      const SizedBox(height: tinySpacing),
                      SelectVarientBody(
                        selectVarientListModel: state.selectVarientListModel,
                      )
                    ]);
              }
              if (state is GetAllVarientsError) {
                return Container();
              } else {
                return const SizedBox();
              }
            })));
  }
}
