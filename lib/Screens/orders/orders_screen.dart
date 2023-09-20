import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/orders/widgets/my_orders_list_tile.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../blocs/orderdetails/order_details_states.dart';
import '../../blocs/orderdetails/orders_details_bloc.dart';
import '../../configs/app_color.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.read<GetAllOrdersDetailsBloc>().add(GetAllOrdersDetails());

    List orderData = [
      {
        'title': 'Order Placed',
        'deliveryDate': 'Delivered,Aug 1',
        'image': 'assets/order_time.png',
        'category': 'Healthcare',
        'quantity': 43
      },
      {
        'title': 'Delivered',
        'deliveryDate': 'Delivered,Jun 12',
        'image': 'assets/order_check.png',
        'category': 'Groceries',
        'quantity': 12
      },
      {
        'title': 'Cancelled by Operations',
        'deliveryDate': 'Delivered,Dec 25',
        'image': 'assets/order_cross.png',
        'category': 'Staples',
        'quantity': 14
      },
      {
        'title': 'Returned',
        'deliveryDate': 'Delivered,Feb 14',
        'image': 'assets/order_share.png',
        'category': 'Dairy Product',
        'quantity': 20
      },
      {
        'title': 'Delivered',
        'deliveryDate': 'Delivered,Jun 12',
        'image': 'assets/order_check.png',
        'category': 'Groceries',
        'quantity': 12
      },
    ];
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: xxTinierSpacing),
                child: Text(
                  "My Orders",
                  style: Theme.of(context)
                      .textTheme
                      .tiny
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              actions: const [
                Icon(Icons.filter_alt, color: AppColor.primary),
                SizedBox(width: smallestSpacing)
              ],
            ),
            body: BlocBuilder<GetAllOrdersDetailsBloc, OrdersDetailsStates>(
                builder: (context, state) {
                  if (state is GetAllOrdersDetailsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetAllOrdersDetailsLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: xxxTinierSpacing,
                      ),
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: orderData.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                       OrdersDetailsScreen( data: state.getOrdersDetailsModel.data)));
                                },
                                child: OrderTile(orderData: orderData, idx: index));
                          }));
                  }
                  if (state is GetAllOrdersDetailsError) {
                    return Container();
                  } else {
                    return const SizedBox();
                  }
                })
            ));
  }
}
