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
              },
              buttonHeight: kElevatedButtonHeightSmall,
              buttonWidth: double.maxFinite,
              child: Text(
                'Add New Address',
                style: Theme.of(context).textTheme.xxTiny.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white),
              )),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
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
                              separatorBuilder: (context, index) =>
                              const SizedBox(height: 6),
                              itemBuilder: (context, index) {
                                return Container(
                                    color: AppColor.offWhite,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: tinierSpacing,
                                            vertical: tinierSpacing),
                                        child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: xMediumSpacing,
                                                  width: xMediumSpacing,
                                                  decoration: const BoxDecoration(
                                                      color:
                                                      AppColor.primaryLighter,
                                                      shape: BoxShape.circle),
                                                  child: const Icon(
                                                    Icons.home_outlined,
                                                    size: xxxSmallestSpacing,
                                                    color: AppColor.primary,
                                                  )),
                                              const SizedBox(
                                                  width: xxxTinierSpacing),
                                              Expanded(
                                                  child: Column(children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              state
                                                                  .fetchAddressModel
                                                                  .data![index]
                                                                  .addressType
                                                                  .toString(),
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .tinier
                                                                  .copyWith(
                                                                  color: AppColor
                                                                      .primary)),
                                                          Spacer(),
                                                          InkWell(
                                                              child: Icon(Icons.close,
                                                                  color:
                                                                  AppColor.primary))
                                                        ]),
                                                    const SizedBox(
                                                        height: xxxTinierSpacing),
                                                    Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Column(children: [
                                                            Text(
                                                                state
                                                                    .fetchAddressModel
                                                                    .data![index]
                                                                    .addressName
                                                                    .toString(),
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .xxxTinier
                                                                    .copyWith(
                                                                    color: AppColor
                                                                        .grey)),
                                                            Text(
                                                                state.fetchAddressModel
                                                                    .data![index].city
                                                                    .toString(),
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .xxxTinier
                                                                    .copyWith(
                                                                    color: AppColor
                                                                        .grey))
                                                          ]),
                                                          InkWell(
                                                              onTap: () {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    EditAddressScreen
                                                                        .routeName,
                                                                    arguments: state
                                                                        .addressDetails[
                                                                    index]);
                                                              },
                                                              child: Container(
                                                                  width:
                                                                  kElevatedButtonHeight,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                      border: Border
                                                                          .all(
                                                                        color: AppColor
                                                                            .primary,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          kBorderRadiusSmall)),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                      xxTiniestSpacing,
                                                                      horizontal:
                                                                      xxxTinierSpacing),
                                                                  child: const Center(
                                                                      child: Text(
                                                                          'EDIT',
                                                                          style: TextStyle(
                                                                              color: AppColor
                                                                                  .black,
                                                                              fontSize:
                                                                              tinierSpacing)))))
                                                        ])
                                                  ]))
                                            ])));
                              });
                        }

                        if (state is FetchAddressError) {
                          return Container();
                        } else {
                          return const SizedBox();
                        }
                      }))
            ])));
  }
}
