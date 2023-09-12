import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/address/widget/location_file_part.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../widgets/search_text_field.dart';
import '../../../blocs/address_bloc/address_bloc.dart';
import '../../../blocs/address_bloc/address_states.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../Screens/address/widget/location_saved_address_body.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return BlocBuilder<AddressBloc, AddressStates>(
      builder: (context, state) {
        if (state is FetchAddressLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchAddressLoaded) {
          return Padding(
              padding: const EdgeInsets.only(
                left: xxTinySpacing,
                top: tinierSpacing,
                right: topBottomPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: topBottomPadding),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.close_rounded)),
                        const SizedBox(width: xxTinySpacing),
                        Text("Select a location",
                            style: Theme.of(context)
                                .textTheme
                                .tinier
                                .copyWith(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: xxxTinySpacing),
                  SearchTextField(
                      hintText: 'Search for area,street name..',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(fontWeight: FontWeight.w300),
                      prefixicon: const Icon(
                        Icons.search,
                        color: AppColor.primary,
                      ),
                      textcontroller: myController),
                  const SizedBox(height: xxTinierSpacing),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LocationCardTile(),
                          const SizedBox(height: tinySpacing),
                          Text("Saved Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .tinier
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: xxxTinySpacing,
                          ),
                          LocationSavedAddressBody(
                              addressData: state.fetchAddressModel.data!),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        }
        if (state is FetchAddressError) {
          return Container();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
