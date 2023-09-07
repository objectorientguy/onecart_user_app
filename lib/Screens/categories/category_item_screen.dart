import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/categories/widgets/category_screen_header.dart';
import 'package:onecart_user_app/Screens/categories/widgets/stores_item_list.dart';
import '../../blocs/get_product_bloc/get_product_bloc.dart';
import '../../blocs/get_product_bloc/get_product_states.dart';
import '../../common_widgets/generic_app_bar.dart';

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
    bool price = true;
    return Scaffold(
        appBar: const GenericAppBar(),
        body: BlocBuilder<GetProductBloc, GetProductStates>(
            builder: (context, state) {
          if (state is FetchProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchProductLoaded) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoryItemScreenHeader(
                      categorydata: state.getProductByIdModel.category!,
                      ),
                  StoreItemList(
                      storedata: state.getProductByIdModel.data!, toShow: price)
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
