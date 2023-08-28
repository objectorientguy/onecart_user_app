import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/categories/widgets/category_screen_header.dart';
import 'package:onecart_user_app/Screens/categories/widgets/stores_item_list.dart';
import '../../blocs/get_product_bloc/get_product_bloc.dart';
import '../../blocs/get_product_bloc/get_product_events.dart';
import '../../blocs/get_product_bloc/get_product_states.dart';
import '../../common_widgets/generic_app_bar.dart';
import '../../data/models/home/home_model.dart';

class CategoryItemScreen extends StatelessWidget {
  static const routeName = 'CategoryItemScreen';
  final Category categoryDetails;

  const CategoryItemScreen({Key? key, required this.categoryDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetProductBloc>().add(FetchProduct());
    //context.read<GetAllCategoriesBloc>().add(FetchItemDetails());
    return Scaffold(
      appBar: const GenericAppBar(),
      body: BlocBuilder<GetProductBloc, GetProductStates>(
        builder: (context, state) {
          if (state is FetchProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchProductLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryItemScreenHeader(state.getProductByIdModel.data!),
                      // ),
                  Expanded(
                    child: StoreItemList(state.getProductByIdModel.data!),
                  ),
                ],
              ),
            );
          }
          if (state is FetchProductError) {
            return Container();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
