import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/presentation/screens/accounts/accounts_screen.dart';
import 'package:uber_clone/presentation/screens/browse/browse_screen.dart';
import 'package:uber_clone/presentation/screens/carts/carts_screen.dart';
import 'package:uber_clone/presentation/screens/home/home_screen.dart';

import '../../bloc/cubits/cubits.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const MainScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;

        return Scaffold(
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              BrowseScreen(),
              CartsScreen(),
              AccountsScreen(),
            ],
          ),
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                onTap: (index) {
                  if (index == 0) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.home);
                  } else if (index == 1) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.browse);
                  } else if (index == 2) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.carts);
                  } else if (index == 3) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.accounts);
                  }
                },
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      color:
                          tabController.index == 0 ? Colors.black : Colors.grey,
                    ),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.search,
                      color:
                          tabController.index == 1 ? Colors.black : Colors.grey,
                    ),
                    text: 'Browse',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.shopping_cart,
                      color:
                          tabController.index == 2 ? Colors.black : Colors.grey,
                    ),
                    text: 'Carts',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person,
                      color:
                          tabController.index == 3 ? Colors.black : Colors.grey,
                    ),
                    text: 'Accounts',
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
