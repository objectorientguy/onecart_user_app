import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/address_bloc/address_bloc.dart';
import '../../blocs/address_bloc/address_event.dart';
import '../../blocs/address_bloc/address_states.dart';
import '../../configs/app_color.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = 'AddressScreen';
 final Map addressDetailsMap = {};
  AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(FetchAddress());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My addresses',
              style: Theme.of(context).textTheme.headingMedium),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.black,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColor.black,
                ))
          ],
        ),
        body: BlocBuilder<AddressBloc, AddressStates>(
          builder: (context, state) {
            if (state is FetchAddressLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is FetchAddressLoaded) {
              log(state.fetchAddressModel.message.toString());
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.fetchAddressModel.data!.length,
                  separatorBuilder: (context, index) => const Divider(
                        height: smallestSpacing,
                        thickness: 2,
                      ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: xxxTinierSpacing),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: AppColor.primaryLighter,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.location_on_outlined,
                                    color: AppColor.primary,
                                  )),
                              const SizedBox(
                                width: xxxTinySpacing,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          state.fetchAddressModel.data![index]
                                              .addressType
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headingTiny),
                                      const SizedBox(width: xxxTinierSpacing),
                                    ],
                                  ),
                                  const SizedBox(height: xxxTiniestSpacing),
                                  Text(
                                    state.fetchAddressModel.data![index]
                                        .addressName
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subHeadingLarge,
                                  ),
                                  Text(
                                    state.fetchAddressModel.data![index].phoneNo
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subHeadingLarge,
                                  ),
                                  // Text(
                                  //   addressData[index]['value'][4],
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .subHeadingLarge
                                  //       .copyWith(fontWeight: FontWeight.w700),
                                  // )
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              // log(state.fetchAddressModel.data![index]
                              //     .toString());
                              // Navigator.pushNamed(
                              //     context, EditAddressScreen.routeName,
                              //     arguments:
                              //         state.addressDetails[index]);
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 7),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 1.0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'EDIT',
                                  style: TextStyle(
                                      color: AppColor.primary, fontSize: 14),
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
    );
  }
}
