import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/widgets/order_tile.dart';
import '../../blocs/orders/orders_bloc.dart';
import '../../blocs/orders/orders_events.dart';
import '../../blocs/orders/orders_states.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetAllOrdersBloc>().add(GetAllOrders());
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders", style: Theme.of(context).textTheme.headingMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: BlocBuilder<GetAllOrdersBloc, OrdersStates>(
          builder: (context, state) {
            if (state is GetAllOrdersLoading) {
              return const Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (state is GetAllOrdersLoaded) {
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.getAllOrdersListModel.data!.length,
                  separatorBuilder: (context, index) => const Divider(
                        height: smallestSpacing,
                        thickness: 2,
                      ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: xxxTinierSpacing),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, OrdersDetailsScreen.routeName,
                              arguments:
                                  state.getAllOrdersListModel.data![index]);
                        },
                        child: OrderTile(
                          dateTime: DateFormat('MMM dd y')
                              .format(state.getAllOrdersListModel.data![index]
                                  .orderPlaced!)
                              .toString(),
                          orderID: state
                              .getAllOrdersListModel.data![index].orderId
                              .toString(),
                          countItem: state
                              .getAllOrdersListModel.data![index].itemCount
                              .toString(),
                          priceTotal:
                              '₹${state.getAllOrdersListModel.data![index].totalPrice.toString()}',
                        ),
                      ),
                    );
                  });
            }
            if (state is GetAllOrdersError) {
              return Container();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
