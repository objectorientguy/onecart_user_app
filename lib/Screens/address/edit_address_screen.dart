import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/address/widget/address_form.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_bloc.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_event.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/address_bloc/address_states.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../common_widgets/generic_app_bar.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/address_model/address_model.dart';
import '../../widgets/progress_bar.dart';

class EditAddressScreen extends StatelessWidget {
  static const routeName = 'EditAddressScreen';
  final AddressDatum addressDataMap;
  final _formKey = GlobalKey<FormState>();

  EditAddressScreen({
    Key? key,
    required this.addressDataMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map saveAddress = {
      'address_type': addressDataMap.addressType,
      'address_name': addressDataMap.addressName,
      'user_contact': addressDataMap.userContact,
      'phone_no': addressDataMap.phoneNo,
      'city': addressDataMap.city,
      'state': addressDataMap.state,
      'pincode': addressDataMap.pincode,
    };
    log('saveAddress===============>$saveAddress');

    return Scaffold(
        appBar: const GenericAppBar(
          title: 'Edit Address',
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(tinierSpacing),
          child: CustomElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AddressBloc>().add(EditAddress(
                      saveAddress: saveAddress,
                      addressId: addressDataMap.addressId));
                }
                const SnackBar(content: Text('Enter the Data'));
                log(saveAddress.toString());
              },
              buttonWidth: double.maxFinite,
              buttonHeight: kElevatedButtonHeight,
              child: Text(
                'SAVE',
                style: Theme.of(context).textTheme.xxTiny.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white)
              ))
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  AddressForm(
                    saveAddress: saveAddress,
                    formKey: _formKey,
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
                          ProgressBar.dismiss(context);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Something went wrong")));
                                                }
                      },
                      child: const SizedBox())
                ]))));
  }
}
