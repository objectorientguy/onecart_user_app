import 'package:flutter/cupertino.dart';

import '../../../configs/app_spacing.dart';
import '../../orders/widgets/order_placed_tile.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const OrderPlacedTile(title: 'Add to Cart');
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: xxxSmallestSpacing,
            ),
        itemCount: 8);
  }
}
