import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class AddressForm extends StatelessWidget {
  final Map saveAddress;
  final formKey;

  const AddressForm({super.key, required this.saveAddress, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onChanged: (value) {
              saveAddress['address_type'] = value;
              log('onChanged=========>${saveAddress['address_type'].toString()}');
            },
            initialValue: saveAddress['address_type'],
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              } else if (RegExp(r"^\([A-Za-z]+[A-Za-z]").hasMatch(value)) {
                return 'Please Enter Valid Address';
              }
              return null;
            },
            onChanged: (value) {
              saveAddress['address_name'] = value;
            },
            initialValue: saveAddress['address_name'],
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
            keyboardType: TextInputType.phone,
            validator: (value) {
              // if (value == null || value.isEmpty) {
              if (value == null || value.isEmpty) {
                return 'Please enter contact number';
              } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                return 'Please enter a valid 10-digit contact number';
              }
              return null;
            },
            onChanged: (value) {
              saveAddress['phone_no'] = value;
            },
            initialValue: saveAddress['phone_no'].toString(),
            decoration: InputDecoration(
              counterText: '',
              hintText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                borderSide: const BorderSide(),
              ),
            ),
            maxLength: 10,
          ),
          const SizedBox(height: xxxTinierSpacing),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter State';
              }
              return null;
            },
            onChanged: (value) {
              saveAddress['state'] = value;
            },
            initialValue: saveAddress['state'],
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter City';
                  }
                  return null;
                },
                onChanged: (value) {
                  saveAddress['city'] = value;
                },
                initialValue: saveAddress['city'],
                decoration: InputDecoration(
                  hintText: 'City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
              )),
              const SizedBox(width: xxxTinierSpacing),
              Expanded(
                  child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter the Pincode';
                  } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                    return 'Please Enter Valid PinCode';
                  }
                  return null;
                },
                onChanged: (value) {
                  saveAddress['pincode'] = value;
                },
                initialValue: saveAddress['pincode'].toString(),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'PinCode',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                    borderSide: const BorderSide(),
                  ),
                ),
                maxLength: 6,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
