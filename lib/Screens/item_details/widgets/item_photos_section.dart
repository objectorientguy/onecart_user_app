import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class ItemPhotosSection extends StatelessWidget {
  const ItemPhotosSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img_2.png'),
                    fit: BoxFit.fitHeight)),
          ),
        ),
        const SizedBox(height: xxxTinySpacing),
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: xxxTinierSpacing,
              );
            },
            itemBuilder: (context, index) {
              if (index == 3) {
                return Stack(children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img_2.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.black),
                      child: const Center(
                          child: Text(
                        '+2',
                        style: TextStyle(color: AppColor.white),
                      )),
                    ),
                  ),
                ]);
              }
              return Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img_2.png'),
                        fit: BoxFit.fitHeight)),
              );
            },
          ),
        ),
        const SizedBox(height: mediumSpacing),
      ],
    );
  }
}
