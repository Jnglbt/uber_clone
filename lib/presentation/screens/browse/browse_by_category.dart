import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits/cubits.dart';
import '../widgets/widgets.dart';

class BrowseByCategory extends StatelessWidget {
  static const String routeName = '/browse-by-category';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const BrowseByCategory(),
    );
  }

  const BrowseByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<RestaurantsByCategoryCubit, RestaurantsByCategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryLoaded) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(state.tag),
                ),
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.restaurants.length,
                  itemBuilder: ((context, index) {
                    var value = state.restaurants.values.elementAt(index);
                    return RestaurantPlate(
                      image: value['image'],
                      name: value['name'],
                      fee: value['fee'],
                      score: value['score'],
                      minTime: value['minTime'],
                      maxTime: value['maxTime'],
                      isSponsored: value['isSponsored'],
                    );
                  }),
                ));
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
