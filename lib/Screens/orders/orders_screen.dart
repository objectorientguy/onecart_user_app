import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/orders/widgets/my_orders_list_tile.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/orders/orders_bloc.dart';
import '../../blocs/orders/orders_events.dart';
import '../../blocs/orders/orders_states.dart';
import '../../configs/app_color.dart';
import '../../data/models/orders/order_details_model.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetAllOrdersBloc>().add(GetAllOrders());

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
              title: Text(
                "My Orders",
                style: Theme.of(context)
                    .textTheme
                    .tiny
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_alt),
                  color: AppColor.primary,
                  onPressed: () {},
                ),
                const SizedBox(width: smallestSpacing)
              ],
            ),
            body: BlocBuilder<GetAllOrdersBloc, OrdersStates>(
                buildWhen: (previousState, currentState) =>
                    currentState is GetAllOrdersLoading ||
                    currentState is GetAllOrdersLoaded ||
                    currentState is GetAllOrdersError,
                builder: (context, state) {
                  if (state is GetAllOrdersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetAllOrdersLoaded) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: xxxTinierSpacing,
                        ),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                state.getAllOrdersListModel.data.orders.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      OrdersDetailsScreen.routeName,
                                      arguments: OrderProductsModel,
                                    );
                                  },
                                  child: OrderTile(
                                      orderList: state.getAllOrdersListModel
                                          .data.orders[index]));
                            }));
                  }
                  if (state is GetAllOrdersError) {
                    return Container();
                  } else {
                    return const SizedBox();
                  }
                })));
  }
}
