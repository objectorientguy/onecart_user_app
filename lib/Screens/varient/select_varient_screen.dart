import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/varient/widgets/select_varient_body.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/varient_bloc/varient_bloc.dart';
import '../../blocs/varient_bloc/varient_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/general_data_model/general_category_data.dart';

class SelectVariantScreen extends StatelessWidget {
  static const routeName = 'SelectVariantScreen';
  final Product dataone;

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
                            imageUrl: dataone.variants[0].image[0],
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
                                style: Theme.of(context)
                                    .textTheme
                                    .tinier
                                    .copyWith(fontWeight: FontWeight.w500)))
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
