import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../Screens/address/add_address_screen.dart';
import '../Screens/address/edit_address_screen.dart';
import '../blocs/address_bloc/address_bloc.dart';
import '../blocs/address_bloc/address_states.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressStates>(
      builder: (context, state) {
        if (state is FetchAddressLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchAddressLoaded) {
          return Container(
              height: kBottomSheetHeight,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(smallCardCurve),
                      topLeft: Radius.circular(smallCardCurve)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.lightBlack,
                        blurRadius: xxTiniestSpacing)
                  ]),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(smallCardCurve),
                      topLeft: Radius.circular(smallCardCurve)),
                  child: BottomAppBar(
                    elevation: xxxTinierSpacing,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: topBottomPadding,
                            right: topBottomPadding,
                            bottom: topBottomPadding,
                            top: topBottomPadding),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Select an Address",
                                  style: Theme.of(context).textTheme.xSmall),
                              const Divider(height: xxxSmallerSpacing),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              AddAddressScreen.routeName,
                                              arguments: false);
                                        },
                                        child: Text(
                                          'Add New Address',
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxSmall
                                              .copyWith(color: Colors.black),
                                        )),
                                    const SizedBox(width: kBottomBarWidth),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: xxxSmallestSpacing,
                                    ),
                                  ]),
                              const Divider(height: xxxSmallerSpacing),
                              Text("Saved Address",
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxSmall
                                      .copyWith(color: Colors.black)),
                              const SizedBox(
                                height: tiniestSpacing,
                              ),
                              Expanded(
                                child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        state.fetchAddressModel.data!.length,
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                          height: smallestSpacing,
                                          thickness: xxxTiniestSpacing,
                                        ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: xxxTinierSpacing),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                    decoration: const BoxDecoration(
                                                        color: AppColor
                                                            .primaryLighter,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons
                                                          .location_on_outlined,
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
                                                            state
                                                                .fetchAddressModel
                                                                .data![index]
                                                                .addressType
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headingTiny),
                                                        const SizedBox(
                                                            width:
                                                                xxTinierSpacing),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height:
                                                            xxxTiniestSpacing),
                                                    Text(
                                                      state
                                                          .fetchAddressModel
                                                          .data![index]
                                                          .addressName
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xxGSmall,
                                                    ),
                                                    Text(
                                                      state.fetchAddressModel
                                                          .data![index].phoneNo
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xxGSmall,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    EditAddressScreen.routeName,
                                                    arguments: state
                                                        .addressDetails[index]);
                                              },
                                              child: Container(
                                                  width: kBottomNavBarHeightX,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: AppColor.primary,
                                                      ),
                                                      color:
                                                          AppColor.primaryLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              kBorderDiscount)),
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
                                                          color:
                                                              AppColor.primary,
                                                          fontSize:
                                                              xxxTinySpacing),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ])),
                  )));
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
