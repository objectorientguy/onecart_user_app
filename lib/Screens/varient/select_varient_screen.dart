import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/varient/widgets/select_varient_body.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/item_details/item_details_model.dart';

class SelectVariantScreen extends StatelessWidget {
  static const routeName = 'SelectVariantScreen';
  final ProductDetailsModel productDetailsModel;

  const SelectVariantScreen({super.key, required this.productDetailsModel});

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                CachedNetworkImage(
                    imageUrl: productDetailsModel
                        .data.productData.variants[0].image[0],
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
                    child: Text(
                        productDetailsModel.data.productData.productName
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .tinier
                            .copyWith(fontWeight: FontWeight.w500)))
              ]),
              const SizedBox(height: tinySpacing),
              SelectVarientBody(
                productDetailsModel: productDetailsModel,
              )
            ])));
  }
}
