import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class AddressFilterChipWidget extends StatefulWidget {
  final Map saveAddressMap;

  const AddressFilterChipWidget({super.key, required this.saveAddressMap});

  @override
  State<AddressFilterChipWidget> createState() =>
      _AddressFilterChipWidgetState();
}

class _AddressFilterChipWidgetState extends State<AddressFilterChipWidget> {
  bool isSelected = false;
  String? selectedType;

  List addressType = [
    'Home',
    'Work',
    'Other',
  ];

  singleSelect(item) {
    setState(() {
      selectedType = item;
      widget.saveAddressMap['address_type']= item;
    });
  }

  @override
  void initState() {
    selectedType = widget.saveAddressMap['address_type'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      for (var item in addressType)
        Padding(
            padding: const EdgeInsets.all(xxTiniestSpacing),
            child: FilterChip(
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.home, color: AppColor.grey),
                    Text(item,
                        style: Theme.of(context)
                            .textTheme
                            .tinier
                            .copyWith(color: AppColor.grey)),
                  ],
                ),
                shape: const StadiumBorder(
                    side: BorderSide(color: AppColor.primary)),
                backgroundColor: selectedType == item
                    ? AppColor.primaryLight
                    : AppColor.white,
                labelPadding: const EdgeInsets.all(xxTiniestSpacing),
                selectedColor: AppColor.primary,
                onSelected: (bool value) {
                  singleSelect(item);
                  log('onTap===============>$selectedType');
                }))
    ]);
  }
}
