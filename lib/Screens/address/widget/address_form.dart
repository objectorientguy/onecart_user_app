import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/address/widget/textfield_widget.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'address_filterchip_widget.dart';

class AddressForm extends StatelessWidget {
  final Map saveAddress;
  final GlobalKey<FormState> formKey;

  const AddressForm(
      {super.key, required this.saveAddress, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
            padding: const EdgeInsets.all(tinierSpacing),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Address (House No.,Building.Street,Area)*',
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.grey)),
                  const SizedBox(height: xxTinierSpacing),
                  TextFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Address';
                        } else if (RegExp(r"^\([A-Za-z]+[A-Za-z]")
                            .hasMatch(value)) {
                          return 'Please Enter Valid Address';
                        }
                        return null;
                      },
                      initialValue: saveAddress['address_name'],
                      onTextFieldChanged: (value) {
                        saveAddress['address_name'] = value;
                        log('onChanged=========>${saveAddress['address_name'].toString()}');
                      }),
                  const SizedBox(height: xxxTinierSpacing),
                  Row(children: [
                    Text('City/district*',
                        style: Theme.of(context)
                            .textTheme
                            .xxxTinier
                            .copyWith(color: AppColor.grey)),
                    const SizedBox(width: kTextboxHeightSmall),
                    Text('State*',
                        style: Theme.of(context)
                            .textTheme
                            .xxxTinier
                            .copyWith(color: AppColor.grey))
                  ]),
                  const SizedBox(height: xxxTinierSpacing),
                  Row(children: [
                    Expanded(
                        child: TextFieldWidget(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter City';
                              }
                              return null;
                            },
                            onTextFieldChanged: (value) {
                              saveAddress['city'] = value;
                            },
                            initialValue: saveAddress['city'])),
                    const SizedBox(width: xxxTinierSpacing),
                    Expanded(
                        child: TextFieldWidget(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter State';
                              }
                              return null;
                            },
                            onTextFieldChanged: (value) {
                              saveAddress['state'] = value;
                            },
                            initialValue: saveAddress['state']))
                  ]),
                  const SizedBox(height: xxxTinierSpacing),
                  Text('Pincode*',
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.grey)),
                  const SizedBox(height: xxxTinierSpacing),
                  SizedBox(
                      width: kAddressTextFieldwidth,
                      child: TextFieldWidget(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter the Pincode';
                            } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                              return 'Please Enter Valid PinCode';
                            }
                            return null;
                          },
                          onTextFieldChanged: (value) {
                            saveAddress['pincode'] = value;
                          },
                          initialValue: saveAddress['pincode'].toString(),
                          maxLength: 6)),
                  const SizedBox(height: xxxTinierSpacing),
                  Text('Directions to reach(optional)*',
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.grey)),
                  TextFieldWidget(
                      onTextFieldChanged: (value) {},
                      maxLines: 2,
                      suffix:
                          const Icon(Icons.mic, color: AppColor.primaryLight)),
                  const SizedBox(height: xxxTinierSpacing),
                  Text('Save As*',
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.grey)),
                  const SizedBox(height: xxTinierSpacing),
                  AddressFilterChipWidget(saveAddressMap: saveAddress),
                  const SizedBox(height: xxxTinierSpacing),
                  Text('Name*',
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.grey)),
                  const SizedBox(height: xxTinierSpacing),
                  TextFieldWidget(onTextFieldChanged: (value) {
                    saveAddress['name'] = value;
                  })
                ])));
  }
}
