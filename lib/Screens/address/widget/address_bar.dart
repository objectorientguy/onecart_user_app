import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../blocs/address_bloc/address_bloc.dart';
import '../../../blocs/address_bloc/address_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(FetchAddress());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: AppColor.primary,
              size: kLocationIconSize,
            ),
            const SizedBox(
              width: xxxTiniestSpacing,
            ),
            Text('Home', style: Theme.of(context).textTheme.headingTiny),
            const SizedBox(
              width: xxxTiniestSpacing,
            ),
            const Center(
              heightFactor: kLocationIconHeightFactor,
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColor.primary,
                size: kLocationIconSize,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: kCircleAvatarRadius,
          ),
          child: SizedBox(
            child: Text(
              'Akshay Nagar 1st Block 1st Cross, Rammurthy nagar...',
              style: Theme.of(context).textTheme.subHeadingMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    return InkWell(
      onTap: () {
        Scaffold.of(context).showBottomSheet<void>(
            elevation: xxTinierSpacing,
            backgroundColor: Colors.grey,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(smallCardCurve),
                    topLeft: Radius.circular(smallCardCurve))),
            (BuildContext context) {
          return const AddressBottomSheet();
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: AppColor.primary,
                size: kLocationIconSize,
              ),
              const SizedBox(
                width: xxxTiniestSpacing,
              ),
              Text('Home', style: Theme.of(context).textTheme.tinier),
              const SizedBox(
                width: xxxTiniestSpacing,
              ),
              const Center(
                heightFactor: kLocationIconHeightFactor,
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.primary,
                  size: kLocationIconSize,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kCircleAvatarRadius,
            ),
            child: SizedBox(
              child: Text(
                'Akshay Nagar 1st Block 1st Cross, Rammurthy nagar...',
                style: Theme.of(context)
                    .textTheme
                    .xxTinier
                    .copyWith(color: AppColor.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
