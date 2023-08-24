import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_bloc.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_event.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/address_bloc/address_states.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/address_model/address_model.dart';

class EditAddressScreen extends StatelessWidget {
  static const routeName = 'EditAddressScreen';
  final AddressDatum addressDataMap;
  static Map saveAddress = {};
  const EditAddressScreen({
    Key? key,
    required this.addressDataMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    saveAddress = {
      'address_type': addressDataMap.addressType,
      'address_name': addressDataMap.addressName,
      'user_contact': addressDataMap.userContact,
      'phone_no': addressDataMap.phoneNo,
      'city': addressDataMap.city,
      'state': addressDataMap.state,
      'pincode': addressDataMap.pincode,
    };
    log('saveAddress.toString()');

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit address',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TextFormField(
                // controller: titleController,
                onChanged: (value) {
                  saveAddress['address_type'] = value;
                  addressDataMap.addressId!;
                  log(saveAddress['address_type'].toString());
                },
                initialValue: addressDataMap.addressType,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: xxxTinierSpacing),
              TextFormField(
                onChanged: (value) {
                  saveAddress['address_name'] = value;
                  addressDataMap.addressId!;
                },
                //controller: addressController,
                initialValue: addressDataMap.addressName,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: xxxTinierSpacing),
              TextFormField(
                onChanged: (value) {
                  saveAddress['phone_no'] = value;
                  addressDataMap.addressId!;
                },
                // controller: phoneController,
                initialValue: addressDataMap.phoneNo.toString(),
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: xxxTinierSpacing),
              TextFormField(
                // controller: stateController,
                onChanged: (value) {
                  saveAddress['state'] = value;
                  addressDataMap.addressId!;
                },
                initialValue: addressDataMap.state,
                decoration: InputDecoration(
                  hintText: 'State',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: xxxTinierSpacing),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    // controller: cityController,
                    onChanged: (value) {
                      saveAddress['city'] = value;
                      addressDataMap.addressId!;
                    },
                    initialValue: addressDataMap.city,
                    decoration: InputDecoration(
                      hintText: 'City',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(kGeneralBorderRadius),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  )),
                  const SizedBox(width: xxxTinierSpacing),
                  Expanded(
                      child: TextFormField(
                    // controller: pinController,
                    onChanged: (value) {
                      saveAddress['pincode'] = value;
                      addressDataMap.addressId!;
                    },
                    initialValue: addressDataMap.pincode.toString(),
                    decoration: InputDecoration(
                      hintText: 'PinCode',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(kGeneralBorderRadius),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: smallSpacing),
              BlocListener<AddressBloc, AddressStates>(
                listener: (BuildContext context, state) {
                  if (state is EditAddressLoading) {
                    const Center(child: CircularProgressIndicator());
                  } else if (state is EditAddressLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Address Saved")));
                    Navigator.pop(context);
                    context.read<AddressBloc>().add(FetchAddress());
                  }
                  if (state is EditAddressError) {
                    const SizedBox();
                  }
                },
                child: CustomElevatedButton(
                    onPressed: () {
                      log(saveAddress.toString());
                      context.read<AddressBloc>().add(EditAddress(
                          saveAddress: saveAddress,
                          addressId: addressDataMap.addressId!));
                    },
                    child: Text(
                      'SAVE',
                      style: Theme.of(context).textTheme.textButtonLarger,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
