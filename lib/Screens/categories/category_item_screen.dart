import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/categories/widgets/stores_item_list.dart';
import '../../blocs/get_product_bloc/get_product_bloc.dart';
import '../../blocs/get_product_bloc/get_product_events.dart';
import '../../blocs/get_product_bloc/get_product_states.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class CategoryItemScreen extends StatefulWidget {
  static const routeName = 'CategoryItemScreen';
  final dynamic categoryDetails;

  const CategoryItemScreen({Key? key, required this.categoryDetails})
      : super(key: key);

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  @override
  Widget build(BuildContext context) {
    bool price = false;
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
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
                    Text(state.getProductByIdModel.category!.categoryName!,
                        style: const TextStyle(color: Colors.black)),
                    Row(children: [
                      Container(
                        child:
                            Image.asset('assets/filter-filled-tool-symbol.png'),
                        height: kIconSizeSmall,
                        width: kIconSizeSmall,
                      ),
                      const SizedBox(width: smallestSpacing),
                      InkWell(
                          onTap: () {
                            context.read<GetProductBloc>().add(SortByPrice(
                                sortPrice: !price,
                                categoryModel: state.getProductByIdModel,
                                productsList: state.productsList));
                          },
                          child: Container(
                              child:
                                  Image.asset('assets/up-and-down-arrow.png'),
                              height: kIconSizeSmall,
                              width: kIconSizeSmall))
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
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StoreItemList(storedata: state.productsList, toShow: price)
                ]);
          }
          if (state is FetchProductError) {
            return Container();
          } else {
            return const SizedBox();
          }
        }));
  }
}
