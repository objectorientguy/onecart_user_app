import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../widgets/search_text_field.dart';
import '../Screens/address/add_address_screen.dart';
import '../../../blocs/address_bloc/address_bloc.dart';
import '../../../blocs/address_bloc/address_states.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../Screens/address/widget/current_location.dart';

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
          return Container(
              decoration: const BoxDecoration(
                  color: AppColor.palewhite,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(smallCardCurve),
                      topLeft: Radius.circular(smallCardCurve)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.lightBlack,
                        blurRadius: xxTiniestSpacing)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: topBottomPadding),
                child: BottomAppBar(
                  //  elevation: xxxTinierSpacing,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: topBottomPadding,
                          right: topBottomPadding,
                          //bottom: topBottomPadding,
                          top: topBottomPadding),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.keyboard_arrow_down_outlined),
                                const SizedBox(width: xxTinySpacing),
                                Text("Select a location",
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxTinier
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ],
                            ),
                            const SizedBox(height: xxxTinySpacing),

                            SearchTextField(
                                hintText: 'Search for area,street name..',
                                prefixicon: const Icon(
                                  Icons.search,
                                  color: AppColor.red,
                                ),
                                textcontroller: myController),
                            const SizedBox(height: xxTinierSpacing),
                            Card(
                              // elevation: xxTiniestSpacing,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(smallCardCurve),
                                      topRight: Radius.circular(smallCardCurve),
                                      bottomLeft:
                                          Radius.circular(smallCardCurve),
                                      bottomRight:
                                          Radius.circular(smallCardCurve))),
                              child: Padding(
                                padding: const EdgeInsets.all(xxxTinierSpacing),
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
                                            color: AppColor.red,
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
                                                          AppColor.red,
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
                                          color: AppColor.red,
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
                                                Navigator.pushNamed(context,
                                                    CurrentLocation.routeName,
                                                    arguments: false);
                                              },
                                              child: Text(
                                                'Use Your Current Location',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxSmall
                                                    .copyWith(
                                                        color:
                                                            AppColor.red,
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
                                        const SizedBox(width: 50),
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
                            Expanded(
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(smallCardCurve),
                                        topRight:
                                            Radius.circular(smallCardCurve),
                                        bottomLeft:
                                            Radius.circular(smallCardCurve),
                                        bottomRight:
                                            Radius.circular(smallCardCurve))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(xxTinierSpacing),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount:
                                          state.fetchAddressModel.data!.length,
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                            height: smallestSpacing,
                                          ),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: xxxTinierSpacing),
                                          child: Row(
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
                                                        color: AppColor
                                                            .mediumBlack,
                                                      )
                                                      // child: Image(image: AssetImage('assets/home.png'),
                                                      //     fit: BoxFit.fill),
                                                      ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: xxxTinySpacing,
                                              ),
                                              Column(
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
                                                          .headingTiny),
                                                  const SizedBox(
                                                      width: xxTinierSpacing),
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
                                                  // Row(
                                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                                  //   children: [
                                                  //     Image.asset('assets/dots.png'),
                                                  //     Image.asset('assets/share.png'),
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     Image.asset('assets/three-dots.png'),
                            //     SizedBox(width: xxTinierSpacing),
                            //     Image.asset('assets/arrow-forward.png',fit: BoxFit.fill),
                            //   ],
                            // ),
                            Text("Recent location",
                                style: Theme.of(context).textTheme.headingTiny),
                            const SizedBox(height: xxxTinierSpacing),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: xxxTinierSpacing),
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
                                                )
                                                // child: Image(image: AssetImage('assets/home.png'),
                                                //     fit: BoxFit.fill),
                                                ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: xxxTinySpacing,
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
                          ])),
                ),
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
