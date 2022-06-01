import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.browse:
        emit(const NavigationState(NavbarItem.browse, 1));
        break;
      case NavbarItem.carts:
        emit(const NavigationState(NavbarItem.carts, 2));
        break;
      case NavbarItem.accounts:
        emit(const NavigationState(NavbarItem.accounts, 3));
        break;
    }
  }
}
