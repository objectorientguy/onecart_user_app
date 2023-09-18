import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class CounterScreen extends StatefulWidget {
  final double? height;
  final double? width;
  final String title;

  const CounterScreen({
    super.key,
    this.height = kAddButtonHeight,
    this.width = kAddButtonWidth,
    this.title = 'ADD',
  });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  bool isVisible = true;
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    if (_count == 1) {
      isVisible = true;
    }
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: _decrementCount,
              style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kAddRadius),
                  ),
                  side: const BorderSide(color: AppColor.primary)),
              child: const Icon(
                Icons.remove,
                size: kCounterIcon,
              ),
            ),
            Text(
              '$_count',
              style: Theme.of(context)
                  .textTheme
                  .xxTinier
                  .copyWith(fontWeight: FontWeight.w500, color: AppColor.black),
            ),
            TextButton(
              onPressed: _incrementCount,
              style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kAddRadius),
                  ),
                  side: const BorderSide(color: AppColor.primary)),
              child: const Icon(
                Icons.add,
                size: kCounterIcon,
              ),
            ),
          ],
        ),
      ),
      visible: isVisible,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: TextButton(
          onPressed: () {
            //context.read<AddToCartBloc>().add(AddItemsToCart(data: null));
            _incrementCount();
            setState(() {
              isVisible = !isVisible;
            });
          },
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(
                horizontal: tinierSpacing, vertical: tiniestSpacing),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kAddRadius)),
            backgroundColor: AppColor.primary,
          ),
          child: Text(widget.title,
              style: Theme.of(context)
                  .textTheme
                  .xxxTinier
                  .copyWith(color: AppColor.white)),
        ),
      ),
    );
  }
}
