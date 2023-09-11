import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/address_bloc/address_bloc.dart';
import '../../blocs/address_bloc/address_event.dart';
import '../../blocs/address_bloc/address_states.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import 'add_address_screen.dart';
import 'edit_address_screen.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = 'AddressScreen';

  AddressScreen({Key? key}) : super(key: key);

  final Map addressDetailsMap = {};

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(FetchAddress());
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'My Addresses',
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(xxxTinySpacing),
        child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddAddressScreen.routeName,
                  arguments: false);
              //arguments: state.addressDetails[index]);
            },
            buttonHeight: kElevatedButtonHeightSmall,
            buttonWidth: double.maxFinite,
            child: Text(
              'Add New Address',
              style: Theme.of(context)
                  .textTheme
                  .xxTiny
                  .copyWith(fontWeight: FontWeight.w600, color: AppColor.white),
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(xxTinierSpacing),
              child: BlocBuilder<AddressBloc, AddressStates>(
                builder: (context, state) {
                  if (state is FetchAddressLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FetchAddressLoaded) {
                    return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.fetchAddressModel.data!.length,
                        separatorBuilder: (context, index) => const Divider(
                              height: smallestSpacing,
                              thickness: xxxTiniestSpacing,
                            ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: xxxTinierSpacing),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: xMediumSpacing,
                                        width: xMediumSpacing,
                                        decoration: const BoxDecoration(
                                            color: AppColor.primaryLighter,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.location_on_outlined,
                                          size: smallestSpacing,
                                          color: AppColor.primary,
                                        )),
                                    const SizedBox(
                                      width: xxxTinySpacing,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                state.fetchAddressModel
                                                    .data![index].addressType
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .tinier),
                                            const SizedBox(
                                                width: xxTinierSpacing),
                                          ],
                                        ),
                                        const SizedBox(
                                            height: xxxTiniestSpacing),
                                        Text(
                                          state.fetchAddressModel.data![index]
                                              .addressName
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxxTinier
                                              .copyWith(color: AppColor.grey),
                                        ),
                                        Text(
                                          state.fetchAddressModel.data![index]
                                              .phoneNo
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxxTinier
                                              .copyWith(color: AppColor.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, EditAddressScreen.routeName,
                                        arguments: state.addressDetails[index]);
                                  },
                                  child: Container(
                                      width: kBottomNavBarHeightX,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.primary,
                                          ),
                                          color: AppColor.primaryLight,
                                          borderRadius: BorderRadius.circular(
                                              kBorderDiscount)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: xxTiniestSpacing,
                                          horizontal: xxxTinierSpacing),
                                      child: const Center(
                                        child: Text(
                                          'EDIT',
                                          style: TextStyle(
                                              color: AppColor.primary,
                                              fontSize: xxxTinySpacing),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          );
                        });
                  }

                  if (state is FetchAddressError) {
                    return Container();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
