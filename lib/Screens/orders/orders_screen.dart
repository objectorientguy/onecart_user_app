import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/orders/orders_bloc.dart';
import '../../blocs/orders/orders_events.dart';
import '../../blocs/orders/orders_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
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
    ];
    context.read<GetAllOrdersBloc>().add(GetAllOrders());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Orders",
            style: Theme.of(context)
                .textTheme
                .tiny
                .copyWith(fontWeight: FontWeight.w500),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: smallestSpacing),
              child: Row(
                children: [
                  Icon(Icons.tune_outlined, color: AppColor.black),
                  SizedBox(width: smallestSpacing),
                  Icon(
                    Icons.shopping_cart_rounded,
                    color: AppColor.black,
                  )
                ],
              ),
            )
          ],
        ),
        body: BlocBuilder<GetAllOrdersBloc, OrdersStates>(
          builder: (context, state) {
            if (state is GetAllOrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllOrdersLoaded) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrdersDetailsScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: leftRightMargin, vertical: topBottomPadding),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: orderData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: xxxTinierSpacing,
                              vertical: xxxTinierSpacing),
                          child: Container(
                            width: kSizedBoxInfinite,
                            height: kSizedBoxHeightLarge,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.lightGrey),
                              borderRadius:
                                  BorderRadius.circular(kGeneralBorderRadius),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: xxxTinierSpacing),
                                      child: SizedBox(
                                          height: kTextboxHeightSmallest,
                                          width: kTextboxHeightSmallest,
                                          child: Image.asset(
                                              orderData[index]['image'])),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        (orderData[index]['title'] ==
                                                    "Returned" ||
                                                orderData[index]['title'] ==
                                                    "Cancelled by Operations")
                                            ? Text(
                                                orderData[index]['title'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .tinier
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColor.brightRed),
                                              )
                                            : Text(orderData[index]['title'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .tinier
                                                    .copyWith(
                                                      color: AppColor.darkGrey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                        (orderData[index]['title'] ==
                                                "Delivered")
                                            ? Text(
                                                orderData[index]
                                                    ['deliveryDate'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTinier
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColor.lightGrey))
                                            : const SizedBox(),
                                        Text(
                                            "${orderData[index]['category']} (${orderData[index]['quantity']} items)",
                                            style: Theme.of(context)
                                                .textTheme
                                                .xxTinier
                                                .copyWith(
                                                    color: AppColor.darkGrey,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: tinierSpacing),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_forward_ios_rounded,
                                          color: AppColor.grey,
                                          size: kCounterIcon),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              );
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
