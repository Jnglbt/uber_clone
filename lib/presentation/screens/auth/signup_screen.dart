import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/presentation/screens/auth/login_screen.dart';
import 'package:uber_clone/presentation/screens/main_screen.dart';

import '../../bloc/cubits/cubits.dart';
import '../widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SignupScreen(),
    );
  }

  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What\'s Your Email Address?',
                      ),
                      CustomTextField(
                        text: 'ENTER YOUR EMAIL',
                        onChanged: (value) {
                          context.read<SignupCubit>().emailChanged(value);
                          print(state.email);
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Your Password?',
                      ),
                      CustomTextField(
                        text: 'ENTER YOUR PASSWORD',
                        onChanged: (value) {
                          context.read<SignupCubit>().passwordChanged(value);
                          print(state.password);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<SignupCubit>()
                              .signupWithCredentials()
                              .then(
                                (value) => value == 'ok'
                                    ? Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        MainScreen.routeName,
                                        ModalRoute.withName('/'),
                                      )
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        SnackBar(
                                          content: Text(value),
                                        ),
                                      ),
                              );
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
