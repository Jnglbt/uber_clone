import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/presentation/bloc/blocs/auth/auth_bloc.dart';
import 'package:uber_clone/presentation/bloc/blocs/user/user_bloc.dart';
import 'package:uber_clone/presentation/bloc/cubits/restaurants/by_category/restaurants_by_category_cubit.dart';
import 'package:uber_clone/presentation/screens/splash/splash_screen.dart';

import 'config/config.dart';
import 'presentation/bloc/cubits/cubits.dart';
import 'repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: AppConstants.firebaseConfig,
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => DatabaseRepositry()),
        RepositoryProvider(create: (context) => StorageRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(
            create: (context) => NavigationCubit(),
          ),
          BlocProvider<DeliveryTypeCubit>(
            create: (context) => DeliveryTypeCubit(),
          ),
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<FoodCategoriesCubit>(
            create: (context) => FoodCategoriesCubit(
              databaseRepositry: context.read<DatabaseRepositry>(),
            ),
          ),
          BlocProvider<RestaurantsCubit>(
            create: (context) => RestaurantsCubit(
              databaseRepositry: context.read<DatabaseRepositry>(),
            ),
          ),
          BlocProvider<RestaurantsByCategoryCubit>(
            create: (context) => RestaurantsByCategoryCubit(
              databaseRepositry: context.read<DatabaseRepositry>(),
            ),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              storageRepository: context.read<StorageRepository>(),
              databaseRepositry: context.read<DatabaseRepositry>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
