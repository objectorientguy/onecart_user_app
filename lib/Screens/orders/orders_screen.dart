import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/orders/widgets/my_orders_list_tile.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/orders/orders_bloc.dart';
import '../../blocs/orders/orders_events.dart';
import '../../blocs/orders/orders_states.dart';
import '../../configs/app_color.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List orderData = [
      {
        'title': 'Order Placed',
        'deliveryDate': 'Delivered,Aug 1',
        'image': 'assets/imgC5.png',
        'category': 'Healthcare',
        'quantity': 43
      },
      {
        'title': 'Delivered',
        'deliveryDate': 'Delivered,Jun 12',
        'image': 'assets/imgC4.png',
        'category': 'Groceries',
        'quantity': 12
      },
      {
        'title': 'Cancelled by Operations',
        'deliveryDate': 'Delivered,Dec 25',
        'image': 'assets/imgC3.png',
        'category': 'Staples',
        'quantity': 14
      },
      {
        'title': 'Returned',
        'deliveryDate': 'Delivered,Feb 14',
        'image': 'assets/imgC2.png',
        'category': 'Dairy Product',
        'quantity': 20
      },
      {
        'title': 'Delivered',
        'deliveryDate': 'Delivered,Jun 12',
        'image': 'assets/imgC4.png',
        'category': 'Groceries',
        'quantity': 12
      },
      {
        'title': 'Delivered',
        'deliveryDate': 'Delivered,Jun 12',
        'image': 'assets/imgC4.png',
        'category': 'Groceries',
        'quantity': 12
      },
      {
        'title': 'Delivered',
        'deliveryDate': 'Delivered,Jun 12',
        'image': 'assets/imgC4.png',
        'category': 'Groceries',
        'quantity': 12
      },
      {
        'title': 'Delivered',
        'deliveryDate': 'Delivered,Jun 12',
        'image': 'assets/imgC4.png',
        'category': 'Groceries',
        'quantity': 12
      },
    ];
    context.read<GetAllOrdersBloc>().add(GetAllOrders());
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
                Icon(Icons.tune_outlined, color: AppColor.primary),
                SizedBox(width: smallestSpacing)
              ],
            ),
            body: BlocBuilder<GetAllOrdersBloc, OrdersStates>(
                builder: (context, state) {
              if (state is GetAllOrdersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAllOrdersLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: xxxTinierSpacing,
                      right: xxxTinierSpacing,
                      top: xxxTinierSpacing),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: orderData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                       const OrdersDetailsScreen()));
                            },
                            child: OrderTile(orderData: orderData, idx: index));
                      }),
                );
              }
              if (state is GetAllOrdersError) {
                return Container();
              } else {
                return const SizedBox();
              }
            })));
  }
}
