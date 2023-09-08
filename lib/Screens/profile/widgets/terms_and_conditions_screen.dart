import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_spacing.dart';

class TermsOfServiceScreen extends StatelessWidget {
  static const routeName = 'TermsOfServiceScreen';

  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: xxxSmallestSpacing, vertical: xxxSmallestSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Service',
                style: Theme.of(context).textTheme.headingMedium,
              ),
              const SizedBox(
                height: tinySpacing,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sem odio enim ut nullam tortor, bibendum interdum. Varius at amet, dignissim morbi ac pulvinar eu blandit lorem. Est pellentesque bibendum quam odio ac, tortor sit. Sed tellus at tellus amet mi.',
              )
            ],
          ),
        ),
      ),
    );
  }
}
