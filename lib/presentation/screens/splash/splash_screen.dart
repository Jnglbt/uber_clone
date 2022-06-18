import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs/blocs.dart';
import '../screens.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state.status);
          if (state.status == AuthStatus.unauthenticated) {
            print(state.status.toString());
            Timer(
              Duration(seconds: 1),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                LoginScreen.routeName,
                ModalRoute.withName('/login'),
              ),
            );
          } else if (state.status == AuthStatus.authenticated) {
            print(state.status.toString());
            Timer(
              Duration(seconds: 1),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                MainScreen.routeName,
                ModalRoute.withName('/'),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.green,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Food Delivery App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
