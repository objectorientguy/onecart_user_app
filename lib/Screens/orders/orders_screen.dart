import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<GetAllOrdersBloc>().add(GetAllOrders());
    return Scaffold(
      appBar: AppBar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headingMedium),
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.black,
              ))
        ],
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
                    // if (index == 6) {
                    //   return const SizedBox();
                    // }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: xxxTinierSpacing),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: AppColor.primaryLighter,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: AppColor.primary,
                                  )),
                              const SizedBox(
                                width: xxxTinySpacing,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      state.getAllOrdersListModel.data![index]
                                          .orderId
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headingTiny),
                                  const SizedBox(height: xxxTiniestSpacing),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.55,
                                    child: Text(
                                      state.getAllOrdersListModel.data![index]
                                          .orderPlaced
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subHeadingLarge,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Items: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subHeadingLarge,
                                      ),
                                      Text(
                                        state.getAllOrdersListModel.data![index]
                                            .itemCount
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subHeadingLarge
                                            .copyWith(color: AppColor.primary),
                                      ),
                                      const SizedBox(width: xxxTinierSpacing),
                                      Text(
                                        'Total Price: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subHeadingLarge,
                                      ),
                                      Text(
                                        '₹${state.getAllOrdersListModel.data![index].totalPrice.toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subHeadingLarge
                                            .copyWith(color: AppColor.primary),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, OrdersDetailsScreen.routeName,
                                  arguments:
                                      state.getAllOrdersListModel.data![index]);
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 1.0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColor.primary,
                                  ),
                                )),
                          ),
                        ],
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
