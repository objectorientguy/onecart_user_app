import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class AddressFilterChipWidget extends StatefulWidget {
  const AddressFilterChipWidget({
    super.key,
  });

  @override
  State<AddressFilterChipWidget> createState() =>
      _AddressFilterChipWidgetState();
}

class _AddressFilterChipWidgetState extends State<AddressFilterChipWidget> {
  bool isSelected = false;
  bool isSelectedWork = false;
  bool isSelectedOther = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
              label: Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: AppColor.grey,
                  ),
                  const SizedBox(width: xxTiniestSpacing),
                  Text('Home',
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.grey)),
                ],
              ),
              showCheckmark: false,
              shape: const StadiumBorder(
                  side: BorderSide(color: AppColor.primary)),
              backgroundColor: AppColor.white,
              labelPadding: const EdgeInsets.all(xxTiniestSpacing),
              selected: isSelected,
              selectedColor: AppColor.primaryLight,
              onSelected: (bool value) {
                setState(() {
                  isSelected = !isSelected;
                });
              }),
          const SizedBox(
            width: tiniestSpacing,
          ),
          FilterChip(
              label: Row(
                children: [
                  const Icon(Icons.laptop_chromebook, color: AppColor.grey),
                  const SizedBox(width: xxTiniestSpacing),
                  Text('Work',
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.grey)),
                ],
              ),
              showCheckmark: false,
              shape: const StadiumBorder(
                  side: BorderSide(color: AppColor.primary)),
              backgroundColor: AppColor.white,
              labelPadding: const EdgeInsets.all(xxTiniestSpacing),
              selected: isSelectedWork,
              selectedColor: AppColor.primaryLight,
              onSelected: (bool value) {
                setState(() {
                  isSelectedWork = !isSelectedWork;
                });
              }),
          const SizedBox(width: tiniestSpacing),
          FilterChip(
              label: Row(children: [
                const Icon(Icons.location_on, color: AppColor.grey),
                const SizedBox(width: xxTiniestSpacing),
                Text('Others',
                    style: Theme.of(context)
                        .textTheme
                        .xxxTinier
                        .copyWith(color: AppColor.grey))
              ]),
              showCheckmark: false,
              shape: const StadiumBorder(
                  side: BorderSide(color: AppColor.primary)),
              backgroundColor: AppColor.white,
              labelPadding: const EdgeInsets.all(xxTiniestSpacing),
              selected: isSelectedOther,
              selectedColor: AppColor.primaryLight,
              onSelected: (bool value) {
                setState(() {
                  isSelectedOther = !isSelectedOther;
                });
              }),
        ],
      ),
    );
  }
}
