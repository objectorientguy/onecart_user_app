import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/orders/orders_screen.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_events.dart';
import '../../blocs/home/home_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../cart/cart_screen.dart';
import '../category_grid/category_grid_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class RootScreen extends StatefulWidget {
  static const routeName = 'RootScreen';

  const RootScreen({
    super.key,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  static int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index == 4) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const CartScreen()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  static final List _widgetOptions = [
    const HomeScreen(),
    const CategoryGridScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    context.read<GetHomeDetailsBloc>().add(GetHomeDetails());

    return Scaffold(
      bottomNavigationBar: Container(
        height: kBottomNavBarHeightX,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kBottomNavBarRadius),
                topRight: Radius.circular(kBottomNavBarRadius)),
            boxShadow: [
              BoxShadow(
                color: AppColor.grey,
                spreadRadius: 1,
                blurRadius: kBottomNavBarRadius,
              ),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(kBottomNavBarRadius),
              topRight: Radius.circular(kBottomNavBarRadius)),
          child: BottomNavigationBar(
            unselectedItemColor: AppColor.lightestGrey,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_rounded), label: 'Categories'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books), label: 'Orders'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
              BottomNavigationBarItem(
                  icon: Center(
                      child: Stack(alignment: Alignment.topCenter, children: [
                    const Padding(
                        padding: EdgeInsets.only(top: xxTiniestSpacing),
                        child: Icon(Icons.shopping_cart_sharp,
                            size: kStarIconSize)),
                    BlocBuilder<GetHomeDetailsBloc, HomeStates>(
                      buildWhen: (previousState, currentState) =>
                          currentState is GetHomeDetailsLoaded,
                      builder: (context, state) {
                        if (state is GetHomeDetailsLoaded) {
                          return Padding(
                              padding:
                                  const EdgeInsets.only(left: smallerSpacing),
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Container(
                                    height: kCartIcon,
                                    width: kCartIcon,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.primary)),
                                Text(
                                    state.homeModel.data.totalCartCount
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxxTinier
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.white))
                              ]));
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                  ])),
                  label: 'Cart')
            ],
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
