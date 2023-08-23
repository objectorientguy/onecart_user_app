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
  final  Map saveAddress;
  const EditAddressScreen({Key? key, required this.addressDataMap, required this.saveAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(FetchAddress());

    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController pinController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    titleController.value =
        TextEditingValue(text: addressDataMap.addressType.toString());
    addressController.value =
        TextEditingValue(text: addressDataMap.addressName.toString());
    phoneController.value =
        TextEditingValue(text: addressDataMap.phoneNo.toString());
    stateController.value =
        TextEditingValue(text: addressDataMap.state.toString());
    cityController.value =
        TextEditingValue(text: addressDataMap.city.toString());
    pinController.value =
        TextEditingValue(text: addressDataMap.pincode.toString());


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
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: xxxTinierSpacing),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: xxxTinierSpacing),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: xxxTinierSpacing),
            TextField(
              controller: stateController,
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
                SizedBox(
                    width: (MediaQuery.of(context).size.width -
                            (2 * leftRightMargin) -
                            xxxTinierSpacing) /
                        2,
                    child: TextField(
                      controller: cityController,
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
                SizedBox(
                    width: (MediaQuery.of(context).size.width -
                            (2 * leftRightMargin) -
                            xxxTinierSpacing) /
                        2,
                    child: TextField(
                      controller: pinController,
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
              listener: (BuildContext context,state) {

                if(state is EditAddressLoading){
                  log('bevakuff');
                 const Center(child: CircularProgressIndicator());
                }
                else if (state is EditAddressLoaded) {
                  log('nonsense');
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Address Saved")));
                  Navigator.pop(context);
                }if (state is EditAddressError) {
                  const SizedBox();
                }
                } ,
              child: CustomElevatedButton(
                  onPressed: () {
                    Map saveAddress =
                    {
                      'address_type': titleController.text,
                      'address_name': addressController.text,
                      'user_contact': phoneController.text,
                      'state': stateController.text,
                      'city': cityController.text,
                      'pincode': pinController.text,
                    };
                    context.read<AddressBloc>().add(EditAddress(saveAddress: saveAddress));
                    log('response==============>');
                  },
                  child: Text(
                    'SAVE',
                    style: Theme.of(context).textTheme.textButtonLarger,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
