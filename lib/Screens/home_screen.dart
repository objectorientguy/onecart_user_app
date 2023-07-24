import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
          ),
        ),
      ),
    );
  }
}
