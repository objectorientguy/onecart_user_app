import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class CategoryListScreen extends StatefulWidget {
  static const routeName = 'CategoryListScreen';
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List categoryData = [
    {'name': 'Fruits & Vegetables', 'value': true},
    {'name': 'Staples', 'value': false},
    {'name': 'Dairy and Bakery', 'value': false},
    {'name': 'Snacks & Branded Fruits', 'value': false},
    {'name': 'Beverages', 'value': false},
    {'name': 'Premium Fruits', 'value': false},
    {'name': 'Home Care', 'value': false},
    {'name': 'Personal Care', 'value': false}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        titleSpacing: xxxTiniestSpacing,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: topBottomPadding),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: xxxTinySpacing, vertical: tinierSpacing),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'Done',
                style: Theme.of(context).textTheme.textButtonLarger,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            leftRightMargin, 0, leftRightMargin, leftRightMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: kCircleAvatarRadius * 1.3,
                  backgroundImage: AssetImage('assets/img.png'),
                ),
                const SizedBox(width: tinySpacing),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 125,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search products...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kSearchBarRadius),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: xxxTinySpacing),
            Text('Choudhary Supermarket',
                style: Theme.of(context).textTheme.subHeadingLarge),
            const SizedBox(height: xxxTinierSpacing),
            Text('Categories',
                style: Theme.of(context)
                    .textTheme
                    .headingLarge
                    .copyWith(fontSize: 32)),
            const SizedBox(height: tinySpacing),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (builder, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: tinierSpacing),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (categoryData[index]['value'] == false) {
                            categoryData[index]['value'] = true;
                          } else if (categoryData[index]['value'] == true) {
                            categoryData[index]['value'] = false;
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: xxxTiniestSpacing),
                            child: Icon(
                              categoryData[index]['value'] == false
                                  ? Icons.radio_button_off
                                  : Icons.radio_button_checked,
                              size: 30,
                              color: categoryData[index]['value'] == false
                                  ? AppColor.grey
                                  : AppColor.primary,
                            ),
                          ),
                          const SizedBox(
                            width: xxxTinierSpacing,
                          ),
                          Text(
                            categoryData[index]['name'],
                            style: Theme.of(context).textTheme.textLarge,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: categoryData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
