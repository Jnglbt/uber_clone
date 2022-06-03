import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/models/models.dart';
import 'package:uber_clone/presentation/screens/auth/login_screen.dart';
import 'package:uber_clone/presentation/screens/main_screen.dart';
import 'package:uber_clone/repositories/database/database_repository.dart';

import '../../bloc/blocs/blocs.dart';
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
                        'What\'s Your First Name?',
                      ),
                      CustomTextField(
                        text: 'ENTER YOUR FIRST NAME',
                        onChanged: (value) {
                          context.read<SignupCubit>().fNameChanged(value);
                          print(state.email);
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What\'s Your Last Name?',
                      ),
                      CustomTextField(
                        text: 'ENTER YOUR LAST NAME',
                        onChanged: (value) {
                          context.read<SignupCubit>().lNameChanged(value);
                          print(state.email);
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What\'s Your Phone Number?',
                      ),
                      CustomTextField(
                        text: 'ENTER YOUR PHONE',
                        onChanged: (value) {
                          context.read<SignupCubit>().phoneChanged(value);
                          print(state.email);
                        },
                      ),
                    ],
                  ),
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
                              .then((value) {
                            if (value == 'ok') {
                              UserModel user = UserModel(
                                id: context.read<SignupCubit>().state.user!.uid,
                                fName: context.read<SignupCubit>().state.fName,
                                lName: context.read<SignupCubit>().state.lName,
                                phone: context.read<SignupCubit>().state.phone,
                                image: '',
                                email: context.read<SignupCubit>().state.email,
                              );

                              context
                                  .read<UserBloc>()
                                  .add(UserCreate(user: user));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(value),
                                ),
                              );
                            }
                          }).whenComplete(
                            () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              MainScreen.routeName,
                              ModalRoute.withName('/'),
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
