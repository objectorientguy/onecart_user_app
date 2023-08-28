import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/bill_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/coupon_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/delivery_details_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/payment_details_section.dart';
import 'package:onecart_user_app/blocs/checkout_bloc/checkout_states.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../blocs/checkout_bloc/checkout_event.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../common_widgets/generic_app_bar.dart';
import '../../configs/app_color.dart';
import '../../data/models/checkout_model/checkout_model.dart';
import 'order_success.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = 'CheckoutScreen';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CheckoutBloc>().add(FetchCheckoutDetails());
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(leftRightMargin),
          child: CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  OrderSuccessScreen.routeName,
                );
              },
              child: Text(
                'PAY AND CHECKOUT',
                style: Theme.of(context).textTheme.textButtonLarger,
              )),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<CheckoutBloc, CheckoutStates>(
            builder: (context, state) {
              if (state is FetchCheckoutLoading) {
                const Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              } else if (state is FetchCheckoutLoaded) {
                return Column(
                  children: [
                    BillSection(
                        state.fetchCheckoutModel.data! as List<CheckoutData>),
                    Container(
                      height: xxSmallerSpacing,
                      color: AppColor.lighterGrey,
                    ),
                    const CouponSection(),
                    Container(
                      height: xxSmallerSpacing,
                      color: AppColor.lighterGrey,
                    ),
                    const DeliveryDetailsSection(),
                    Container(
                      height: xxSmallerSpacing,
                      color: AppColor.lighterGrey,
                    ),
                    const PaymentDetailsSection(),
                  ],
                );
              }
              if (state is FetchCheckoutError) {
                return Container();
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
