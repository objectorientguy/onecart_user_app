import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../configs/app_color.dart';

class GenericAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GenericAppBar(
      {Key? key,
      this.title = '',
      this.leading,
      this.actions,
      this.centerTitle = true,
      this.backgroundColor,
      this.style})
      : super(key: key);
  final bool? centerTitle;
  final String title;
  final Widget? leading;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      actions: actions,
      title: Text(title,
          style: (style == null)
              ? Theme.of(context).textTheme.mediumLarge
              : style),
      leading: (leading == null)
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.black,
              ),
            )
          : leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
