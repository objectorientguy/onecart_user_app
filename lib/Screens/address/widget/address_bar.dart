import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../blocs/address_bloc/address_bloc.dart';
import '../../../blocs/address_bloc/address_event.dart';
import '../../../common_widgets/address_bottom_sheet.dart';
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
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            elevation: xxTinierSpacing,
            backgroundColor: Colors.white,
            context: context,
            builder: (BuildContext context) {
              return const AddressBottomSheet();
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on,
            color: AppColor.primary,
            size: kLocationIconSize,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: kSuccessDescriptionWidth,
                      child: Text(
                        'Akshay Nagar 1st Block 1st Cross, Rammurthy nagar...',
                        style: Theme.of(context)
                            .textTheme
                            .xxTinier
                            .copyWith(color: AppColor.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
