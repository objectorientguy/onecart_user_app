import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/address/widget/location_file_part.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../widgets/search_text_field.dart';
import '../../../blocs/address_bloc/address_bloc.dart';
import '../../../blocs/address_bloc/address_states.dart';
import '../../../configs/app_color.dart';
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
                           const LocationCardTile(),
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
