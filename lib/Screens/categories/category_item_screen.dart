import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/categories/widgets/stores_item_list.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/get_product_bloc/get_product_bloc.dart';
import '../../blocs/get_product_bloc/get_product_events.dart';
import '../../blocs/get_product_bloc/get_product_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class CategoryItemScreen extends StatefulWidget {
  static const routeName = 'CategoryItemScreen';

  const CategoryItemScreen({Key? key}) : super(key: key);

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  @override
  Widget build(BuildContext context) {
    bool price = false;
    return Scaffold(
        appBar: AppBar(
          elevation: kCategoryAppBarElevation,
          leading: InkWell(
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          title: BlocBuilder<GetProductBloc, GetProductStates>(
              builder: (context, state) {
            if (state is FilterPriceLoaded) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: kSizedBoxInfinite,
                      child: Text(
                        "",
                        style: Theme.of(context).textTheme.xxTinier.copyWith(
                            fontWeight: FontWeight.w500, color: AppColor.black),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Row(children: [
                      const Icon(
                        Icons.filter_alt,
                        color: AppColor.grey,
                      ),
                      const SizedBox(width: smallestSpacing),
                      InkWell(
                          onTap: () {
                            context.read<GetProductBloc>().add(SortByPrice(
                                sortPrice: !price,
                                categoryModel: state.getProductByIdModel,
                                productsList: state.productsList));
                          },
                          child: const Icon(
                            Icons.swap_vert_outlined,
                            color: AppColor.grey,
                          ))
                    ])
                  ]);
            }
            if (state is FetchProductError) {
              return Container();
            } else {
              return const SizedBox();
            }
          }),
        ),
        body: BlocBuilder<GetProductBloc, GetProductStates>(
            builder: (context, state) {
          if (state is FetchProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FilterPriceLoaded) {
            price = state.sortedValue ?? false;

            if (state.getProductByIdModel.products.isNotEmpty) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: StoreItemList(
                            storedata: state.productsList, toShow: price))
                  ]);
            } else {
              return Center(
                  child: Text(
                'Sorry! No Products found',
                style: Theme.of(context).textTheme.xTinier.copyWith(
                    color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
              ));
            }
          }
          if (state is FetchProductError) {
            return Container();
          } else {
            return const SizedBox();
          }
        }));
  }
}
