import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class AddressForm extends StatelessWidget {
  final Map saveAddress;

  const AddressForm({super.key, required this.saveAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          // controller: titleController,
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
          onChanged: (value) {
            saveAddress['address_name'] = value;
          },
          //controller: addressController,
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
          onChanged: (value) {
            saveAddress['phone_no'] = value;
          },
          // controller: phoneController,
          initialValue: saveAddress['phone_no'].toString(),
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
              // controller: cityController,
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
              // controller: pinController,
              onChanged: (value) {
                saveAddress['pincode'] = value;
              },
              initialValue: saveAddress['pincode'].toString(),
              decoration: InputDecoration(
                hintText: 'PinCode',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
