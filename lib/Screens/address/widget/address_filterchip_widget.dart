import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';

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
  List addressTypeList = [
   'Home',
     'Work',
      'Other'

  ];

  singleSelect(item) {
    setState(() {
      selectedType=item;
    });
  }

  @override
  void initState() {
    selectedType = widget.saveAddressMap['address_type'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var item in addressTypeList)
          FilterChip(
              label: Row(
                children: [
                  Text(item,
                      style: Theme.of(context)
                          .textTheme
                          .tinier
                          .copyWith(color: AppColor.grey)),
                ],
              ),
              // showCheckmark: false,
              shape: const StadiumBorder(
                  side: BorderSide(color: AppColor.primary)),
              backgroundColor: selectedType == item
                  ? AppColor.primaryLight
                  : AppColor.white,
             // labelPadding: const EdgeInsets.all(xxTiniestSpacing),
              // selected: addressType.contains(selectedType),
              // selectedColor: AppColor.primaryLight,
              onSelected: (bool value) {
                  singleSelect(item);
                log('onTap===============>$selectedType');
              }),
        // const SizedBox(
        //   width: tiniestSpacing,
        // ),
        // FilterChip(
        //     label: Row(
        //       children: [
        //         const Icon(Icons.laptop_chromebook, color: AppColor.grey),
        //         const SizedBox(width: xxTiniestSpacing),
        //         Text('Work',
        //             style: Theme
        //                 .of(context)
        //                 .textTheme
        //                 .xxxTinier
        //                 .copyWith(color: AppColor.grey)),
        //       ],
        //     ),
        //     showCheckmark: false,
        //     shape: const StadiumBorder(
        //         side: BorderSide(color: AppColor.primary)),
        //     backgroundColor: AppColor.white,
        //     labelPadding: const EdgeInsets.all(xxTiniestSpacing),
        //     selected: isSelectedWork,
        //     selectedColor: AppColor.primaryLight,
        //     onSelected: (bool value) {
        //       setState(() {
        //         isSelectedWork = !isSelectedWork;
        //       });
        //     }),
        // const SizedBox(width: tiniestSpacing),
        // FilterChip(
        //     label: Row(children: [
        //       const Icon(Icons.location_on, color: AppColor.grey),
        //       const SizedBox(width: xxTiniestSpacing),
        //       Text('Others',
        //           style: Theme
        //               .of(context)
        //               .textTheme
        //               .xxxTinier
        //               .copyWith(color: AppColor.grey))
        //     ]),
        //     showCheckmark: false,
        //     shape: const StadiumBorder(
        //         side: BorderSide(color: AppColor.primary)),
        //     backgroundColor: AppColor.white,
        //     labelPadding: const EdgeInsets.all(xxTiniestSpacing),
        //     selected: isSelectedOther,
        //     selectedColor: AppColor.primaryLight,
        //     onSelected: (bool value) {
        //       setState(() {
        //         isSelectedOther = !isSelectedOther;
        //       });
        //     }),
      ],
    );
  }
}
