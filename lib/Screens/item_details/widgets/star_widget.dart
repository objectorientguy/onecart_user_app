import 'package:flutter/cupertino.dart';

class StarDisplayWidget extends StatelessWidget {
  final double value;
  final Widget filledStar;
  final Widget unfilledStar;
  final Widget halfFilledStar;

  const StarDisplayWidget({
    Key? key,
    this.value = 0,
    required this.filledStar,
    required this.unfilledStar,
    required this.halfFilledStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return index < value
            ? (value - index < 1 && value % index != 0)
                ? halfFilledStar
                : filledStar
            : unfilledStar;
      }),
    );
  }
}
