import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/address/widget/current_location.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../widgets/search_text_field.dart';
import '../Screens/address/add_address_screen.dart';
import '../../../blocs/address_bloc/address_bloc.dart';
import '../../../blocs/address_bloc/address_states.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

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
          return BottomAppBar(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: xxTinySpacing,
                    right: topBottomPadding,
                    top: topBottomPadding),
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
                                  .xxTinier
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const SizedBox(height: xxxTinySpacing),
                    SearchTextField(
                        hintText: 'Search for area,street name..',
                        hintStyle: Theme.of(context).textTheme.xxxTinier,
                        prefixicon: const Icon(
                          Icons.search,
                          color: AppColor.lighterRed,
                        ),
                        textcontroller: myController),
                    const SizedBox(height: xxTinierSpacing),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(smallCardCurve),
                                      topRight: Radius.circular(smallCardCurve),
                                      bottomLeft:
                                          Radius.circular(smallCardCurve),
                                      bottomRight:
                                          Radius.circular(smallCardCurve))),
                              child: Padding(
                                padding: const EdgeInsets.all(tinierSpacing),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: AppColor.lighterRed,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  AddAddressScreen.routeName,
                                                  arguments: false);
                                            },
                                            child: Text(
                                              'Add New Address',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxSmall
                                                  .copyWith(
                                                      color:
                                                          AppColor.lighterRed,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(
                                              width: kBottomBarWidth),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: xxTinySpacing,
                                          ),
                                        ]),
                                    const Divider(height: xxxSmallestSpacing),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.my_location,
                                          color: AppColor.lighterRed,
                                        ),
                                        const SizedBox(width: xxTiniestSpacing),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  CurrentLocation.routeName,
                                                );
                                              },
                                              child: Text(
                                                'Use Your Current Location',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxSmall
                                                    .copyWith(
                                                        color:
                                                            AppColor.lighterRed,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: xxTiniestSpacing,
                                              width: xxxTinierSpacing,
                                            ),
                                            Text(
                                              'Tatya Tope Nagar, Deo,Nagpur',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxGSmall
                                                  .copyWith(
                                                      color: AppColor.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: xxLargeSpacing),
                                        const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: xxTinySpacing,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: tinySpacing),
                            Text("Saved Address",
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTinier
                                    .copyWith(color: Colors.black)),
                            const SizedBox(
                              height: tiniestSpacing,
                            ),
                            ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.fetchAddressModel.data!.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      height: smallestSpacing,
                                    ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: xxTiniestSpacing),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: xMediumSpacing,
                                                width: xMediumSpacing,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: const Icon(
                                                  Icons.home_outlined,
                                                  size: smallestSpacing,
                                                  color: AppColor.mediumBlack,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: xxTinierSpacing,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                state.fetchAddressModel
                                                    .data![index].addressType
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headingTiny),
                                            const SizedBox(
                                                width: xxTinierSpacing),
                                            const SizedBox(
                                                height: xxxTiniestSpacing),
                                            Text(
                                              state.fetchAddressModel
                                                  .data![index].addressName
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxGSmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            const SizedBox(height: tinySpacing),
                            Text("Recent location",
                                style: Theme.of(context).textTheme.headingTiny),
                            const SizedBox(height: xxxTinierSpacing),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(xxTinierSpacing),
                                child: Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: xMediumSpacing,
                                                width: xMediumSpacing,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: const Icon(
                                                  Icons.home_outlined,
                                                  size: smallestSpacing,
                                                  color: AppColor.mediumBlack,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: xxTinierSpacing,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                state.fetchAddressModel.data![0]
                                                    .addressType
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headingTiny),
                                            const SizedBox(
                                                width: xxTinierSpacing),
                                            const SizedBox(
                                                height: xxxTiniestSpacing),
                                            Text(
                                              state.fetchAddressModel.data![0]
                                                  .addressName
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxGSmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
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
