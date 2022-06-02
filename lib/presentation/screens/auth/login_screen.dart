import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/presentation/bloc/cubits/cubits.dart';
import 'package:uber_clone/presentation/screens/main_screen.dart';
import 'package:uber_clone/presentation/screens/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginScreen(),
    );
  }

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomTextField(
                        text: 'Email',
                        onChanged: (value) {
                          context.read<LoginCubit>().emailChanged(value);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        text: 'Password',
                        onChanged: (value) {
                          context.read<LoginCubit>().passwordChanged(value);
                        },
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueGrey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.transparent,
                              ),
                              onPressed: () {
                                context
                                    .read<LoginCubit>()
                                    .signinWithCredentials()
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'LOGIN',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: const LinearGradient(colors: [
                                Colors.red,
                                Colors.blueGrey,
                              ]),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.transparent,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'SIGN UP',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
