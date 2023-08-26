import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../blocs/view_cart_bloc/view_cart_bloc.dart';
import '../../../blocs/view_cart_bloc/view_cart_events.dart';
import '../../../blocs/view_cart_bloc/view_cart_states.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<GetAllCartItemsBloc>().add(GetAllCartItems());
    return BlocBuilder<GetAllCartItemsBloc, ViewCartStates>(
      builder: (context, state) {
        if (state is GetAllCartItemsLoading) {
          return const Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (state is GetAllCartItemsLoaded) {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.viewCartModel.data!.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.24,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img_2.png'))),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.68,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.viewCartModel.data![index].product!.details
                                .toString(),
                            style: Theme.of(context).textTheme.textLarge,
                          ),
                          const SizedBox(
                            height: tinySpacing,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '₹${state.viewCartModel.data![index].product!.discountedCost.toString()}',
                                    style:
                                        Theme.of(context).textTheme.headingTiny,
                                  ),
                                  const SizedBox(
                                    width: xxxTinierSpacing,
                                  ),
                                  Text(
                                    '₹${state.viewCartModel.data![index].variant!.variantPrice.toString()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subHeadingMedium
                                        .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                  const SizedBox(
                                    width: xxxTinierSpacing,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.grey,
                                        ),
                                        color: AppColor.primaryLight,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: xxTiniestSpacing,
                                        horizontal: xxTinierSpacing),
                                    child: Center(
                                      child: Text(
                                          '${state.viewCartModel.data![index].product!.discount.toString()}%OFF',
                                          style: Theme.of(context)
                                              .textTheme
                                              .textSmall
                                              .copyWith(
                                                  color: AppColor.primary,
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 2),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: AppColor.primary,
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: xxxTinierSpacing),
                                    child: Text('1',
                                        style: Theme.of(context)
                                            .textTheme
                                            .textMedium
                                            .copyWith(color: AppColor.primary)),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 2),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: AppColor.primary,
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: xxxSmallSpacing,
                );
              },
            ),
          );
        }
        if (state is GetAllCartItemsError) {
          return Container();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
