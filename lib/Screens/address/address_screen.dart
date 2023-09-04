import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/address_bloc/address_bloc.dart';
import '../../blocs/address_bloc/address_event.dart';
import '../../blocs/address_bloc/address_states.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_dimensions.dart';
import '../../widgets/address_tile.dart';
import 'add_address_screen.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = 'AddressScreen';

  AddressScreen({Key? key}) : super(key: key);

  final Map addressDetailsMap = {};

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(FetchAddress());
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'My Addresses',
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kGeneralBorderRadiusMedium),
        child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddAddressScreen.routeName,
                  arguments: false);
              //arguments: state.addressDetails[index]);
            },
            buttonHeight: kElevatedButtonHeightSmall,
            buttonWidth: double.maxFinite,
            child: Text(
              'Add New Address',
              style: Theme.of(context).textTheme.textButtonLarger,
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kBorderRadiusSmall),
              child: BlocBuilder<AddressBloc, AddressStates>(
                builder: (context, state) {
                  if (state is FetchAddressLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FetchAddressLoaded) {
                    return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.fetchAddressModel.data!.length,
                        separatorBuilder: (context, index) => const Divider(
                              height: smallestSpacing,
                              thickness: 2,
                            ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:const EdgeInsets.symmetric(
                                horizontal: xxxTinierSpacing),
                            child: AddressTile(
                                addressDetail: state.addressDetails[index],
                                typeAddress: state
                                    .fetchAddressModel.data![index].addressType
                                    .toString(),
                                nameAddress: state
                                    .fetchAddressModel.data![index].addressName
                                    .toString(),
                                phoneNumber: state
                                    .fetchAddressModel.data![index].phoneNo
                                    .toString()),
                          );
                        });
                  }

                  if (state is FetchAddressError) {
                    return Container();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


