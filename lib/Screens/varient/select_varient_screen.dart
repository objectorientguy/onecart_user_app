import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/varient_bloc/varient_bloc.dart';
import '../../blocs/varient_bloc/varient_events.dart';
import '../../blocs/varient_bloc/varient_states.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/item_details/item_details_model.dart';

class SelectVariantScreen extends StatelessWidget {
  static const routeName = 'SelectVariantScreen';
  final ItemDetailsData data;

  const SelectVariantScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    context.read<SelectVarientBloc>().add(GetAllVarients());

    return Scaffold(
        appBar: AppBar(
          title: Text('Select Variant',
              style: Theme.of(context).textTheme.headingMedium),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: AppColor.black,
                size: 30,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColor.black,
                ))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: topBottomPadding, horizontal: leftRightMargin),
            child: CustomElevatedButton(
                onPressed: () {},
                child: Text(
                  'DONE',
                  style: Theme.of(context).textTheme.textButtonLarger,
                )),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: BlocBuilder<SelectVarientBloc, SelectVarientStates>(
              builder: (context, state) {
                if (state is GetAllVarientsLoading) {
                  return const Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (state is GetAllVarientsLoaded) {
                  log(state.selectVarientListModel.message.toString());
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img_2.png',
                              height: 50,
                            ),
                            const SizedBox(
                              width: xxxTinierSpacing,
                            ),
                            Flexible(
                                child: Text(data.companyName!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .textLarge
                                        .copyWith(
                                            fontWeight: FontWeight.w500))),
                          ],
                        ),
                        const SizedBox(height: tinySpacing),
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                state.selectVarientListModel.data!.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: xxxTinySpacing),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(leftRightMargin),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColor.lightGrey),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '₹${state.selectVarientListModel.data![index].weight.toString()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headingTiny,
                                        ),
                                        const SizedBox(
                                            height: xxxTiniestSpacing),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '₹${state.selectVarientListModel.data![index].discountedCost.toString()}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subHeadingLarge,
                                            ),
                                            const SizedBox(
                                                width: xxxTinierSpacing),
                                            Text(
                                              '₹${state.selectVarientListModel.data![index].variantPrice.toString()}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subHeadingMedium
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                            ),
                                            const SizedBox(
                                                width: xxxTinierSpacing),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColor.grey,
                                                  ),
                                                  color: AppColor.primaryLight,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical:
                                                          xxTiniestSpacing,
                                                      horizontal:
                                                          xxTinierSpacing),
                                              child: Center(
                                                child: Text(
                                                    state.selectVarientListModel
                                                        .data![index].discount
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .textSmall
                                                        .copyWith(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: tinierSpacing,
                                            vertical: tiniestSpacing),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        backgroundColor: AppColor.primary,
                                      ),
                                      child: Text('SELECT',
                                          style: Theme.of(context)
                                              .textTheme
                                              .textButtonLarge),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ]);
                }
                if (state is GetAllVarientsError) {
                  return Container();
                } else {
                  return const SizedBox();
                }
              },
            )));
  }
}
