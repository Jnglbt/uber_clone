import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cubits/cubits.dart';
import '../../widgets/widgets.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.food_bank,
                        size: 50,
                      ),
                      Text('Restaurants'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.local_drink,
                        size: 50,
                      ),
                      Text('Alcohol'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.local_taxi,
                        size: 50,
                      ),
                      Text('Ride'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<RestaurantsCubit, RestaurantsState>(
            builder: (context, state) {
              if (state is RestaurantsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is RestaurantsLoaded) {
                return ListView.builder(
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
                );
              } else {
                return Text('Something went wrong');
              }
            },
          ),
          // RestaurantPlate(
          //     image:
          //         'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
          //     name: 'SUSHI SIEMA',
          //     score: 4.7,
          //     minTime: 40,
          //     maxTime: 60),
          // RestaurantPlate(
          //   image:
          //       'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          //   name: 'mi piace',
          //   score: 4.8,
          //   minTime: 30,
          //   maxTime: 50,
          //   isSponsored: true,
          //   fee: 5.99,
          // ),
          // RestaurantPlate(
          //   image:
          //       'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
          //   name: 'Nocna Wyżerka',
          //   score: 4.5,
          //   minTime: 55,
          //   maxTime: 75,
          //   isSponsored: false,
          //   fee: 9.99,
          // ),
        ],
      ),
    );
  }
}
