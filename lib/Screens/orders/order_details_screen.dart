import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:onecart_user_app/Screens/orders/widgets/item_orders_expansiontile.dart';
import 'package:onecart_user_app/Screens/orders/widgets/order_details_bottom_appbar.dart';
import 'package:onecart_user_app/common_widgets/oder_detail_screen_card_two.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/orders/orders_bloc.dart';
import '../../blocs/orders/orders_events.dart';
import '../../blocs/orders/orders_states.dart';
import '../../common_widgets/order_detail_screen_card.dart';
import '../../configs/app_color.dart';

class OrdersDetailsScreen extends StatelessWidget {
  static const routeName = 'OrdersDetailsScreen';
  // final OrderDetailsData orderDetailsData;

  const OrdersDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetAllOrdersBloc>().add(GetAllOrderDetails());
    // List orderData = [
    //   {
    //     'title': 'Name',
    //     'status': 'Ayushi Chintawar',
    //   },
    //   {
    //     'title': 'Order Number',
    //     'status': '1661587456982A2',
    //   },
    //   {
    //     'title': 'Order Date',
    //     'status': '29 August 2022',
    //   },
    //   {
    //     'title': 'Product Total',
    //     'status': '₹ 583.00',
    //   },
    //   {
    //     'title': 'Order Amount',
    //     'status': '₹ 583.00 (3 items)',
    //   },
    //   {
    //     'title': 'Delivery Fee',
    //     'status': 'Free',
    //   },
    //   {
    //     'title': 'Invoice Number',
    //     'status': 'TFM511455884510',
    //   },
    //   {
    //     'title': 'Invoice Amount',
    //     'status': '₹ 575.00',
    //   }
    // ];

    return Scaffold(
        appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.black,
              ),
            ),
            title: Text('Order Details',
                style: Theme.of(context).textTheme.xxTiny),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: xxTinierSpacing),
                child: TextButton(
                    onPressed: () {},
                    child: const Text('Help',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColor.darkGrey))),
              )
            ]),
        bottomNavigationBar: const OrderDetailsBottomAppBar(),
        body: BlocBuilder<GetAllOrdersBloc, OrdersStates>(
            buildWhen: (previousState, currentState) =>
                currentState is GetAllOrdersDetailsLoading ||
                currentState is GetAllOrdersDetailsLoaded ||
                currentState is GetAllOrdersDetailsError,
            builder: (context, state) {
              if (state is GetAllOrdersDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAllOrdersDetailsLoaded) {
                return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: xxTinySpacing, vertical: tinierSpacing),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: tiniestSpacing),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order Status',
                                        style: Theme.of(context)
                                            .textTheme
                                            .xxTiny
                                            .copyWith(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.w500)),
                                    const SizedBox(height: xxxTinierSpacing),
                                    Text(
                                        "Delivered on, ${DateFormat('MMM d').format(state.getOrdersDetailsModel.data.trackingData.delivered)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.primary)),
                                    const SizedBox(height: xxxSmallestSpacing),
                                  ],
                                ),
                              ),
                              Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: AppColor.transparent),
                                  child: OrderTrackingExpansionTile(
                                      trackData: state.getOrdersDetailsModel
                                          .data.trackingData)),
                              const SizedBox(height: xxTinierSpacing),
                              Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: AppColor.transparent),
                                  child: OderDetailExpansionTile(
                                    orderData:
                                        state.getOrdersDetailsModel.data.order,
                                    // orderData: orderData,
                                  )),
                              const SizedBox(height: xxTinierSpacing),
                              Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: AppColor.transparent),
                                  child: ItemOrderedExpansionTile(
                                    orderProductData: state
                                        .getOrdersDetailsModel.data.products,
                                  )),
                            ])));
              }
              if (state is GetAllOrdersDetailsError) {
                return Container();
              } else {
                return const SizedBox();
              }
            }));
  }
}
