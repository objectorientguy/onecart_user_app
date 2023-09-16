import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/address/widget/address_form.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_bloc.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_event.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/address_bloc/address_states.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../common_widgets/generic_app_bar.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/progress_bar.dart';

class AddAddressScreen extends StatelessWidget {
  static const routeName = 'AddAddressScreen';
  final _formKey = GlobalKey<FormState>();

  AddAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map addAddress = {
      'address_type': "",
      'address_name': "",
      'user_contact': "9898989898",
      'phone_no': "9898989898",
      'city': "",
      'state': "",
      'pincode': "",
      "name": "",
    };

    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Add New Address',
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(tinierSpacing),
        child: CustomElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context
                    .read<AddressBloc>()
                    .add(AddAddress(addAddress: addAddress));
              }
              const SnackBar(content: Text('Enter the Data'));
            },
            buttonWidth: double.maxFinite,
            buttonHeight: kElevatedButtonHeight,
            child: Text(
              'SAVE',
              style: Theme.of(context)
                  .textTheme
                  .xxTiny
                  .copyWith(fontWeight: FontWeight.w600, color: AppColor.white),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AddressForm(
                saveAddress: addAddress,
                formKey: _formKey,
              ),
              const SizedBox(height: smallSpacing),
              BlocListener<AddressBloc, AddressStates>(
                  listener: (BuildContext context, state) {
                    if (state is AddAddressLoading) {
                      ProgressBar.show(context);
                    } else if (state is AddAddressLoaded) {
                      ProgressBar.dismiss(context);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("New Address Added")));
                      context.read<AddressBloc>().add(FetchAddress());
                    }
                    if (state is AddAddressError) {
                      ProgressBar.dismiss(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Something went wrong")));
                      const SizedBox();
                    }
                  },
                  child: const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
