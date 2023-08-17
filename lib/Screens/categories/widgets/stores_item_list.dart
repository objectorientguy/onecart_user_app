import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../blocs/get_product_bloc/get_product_bloc.dart';
import '../../../blocs/get_product_bloc/get_product_events.dart';
import '../../../blocs/get_product_bloc/get_product_states.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../item_details/item_details_screen.dart';

class StoreItemList extends StatelessWidget {
  const StoreItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<GetProductBloc>().add(FetchProduct());
    return BlocBuilder<GetProductBloc, GetProductStates>(
      builder: (context, state) {
        if (state is FetchProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchProductLoaded) {
          log(state.getProductByIdModel.message.toString());
          return Column(
            children: [
              const SizedBox(height: 50),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.getProductByIdModel.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ItemDetailsScreen.routeName,
                          arguments: false);
                    },
                    child: Row(
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
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.getProductByIdModel.data![index].details
                                    .toString(),
                                style: Theme.of(context).textTheme.textLarge,
                              ),
                              const SizedBox(
                                height: tinySpacing,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '₹300',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headingSmall,
                                      ),
                                      const SizedBox(
                                        width: xxxTinierSpacing,
                                      ),
                                      Text(
                                        '₹300',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subHeadingLarge
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
                                          child: Text('40% OFF',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .textSmall
                                                  .copyWith(
                                                      color: AppColor.primary,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: xxTinySpacing,
                                          vertical: xxTinierSpacing),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: AppColor.primary,
                                    ),
                                    child: Text('ADD',
                                        style: Theme.of(context)
                                            .textTheme
                                            .textButtonLarge),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  if (index == 0 || index == 7) {
                    return const SizedBox(
                      height: smallSpacing,
                    );
                  }
                  return const Divider(
                    height: xxxSmallSpacing,
                  );
                },
              ),
            ],
          );
        }
        if (state is FetchProductError) {
          return Container();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
