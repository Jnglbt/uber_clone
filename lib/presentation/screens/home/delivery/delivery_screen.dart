import 'dart:ui';

import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ac_unit,
                        size: 50,
                      ),
                      Text('Text'),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
            RestaurantPlate(
                image:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                name: 'SUSHI SIEMA',
                score: 4.7,
                minTime: 40,
                maxTime: 60),
            RestaurantPlate(
              image:
                  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              name: 'mi piace',
              score: 4.8,
              minTime: 30,
              maxTime: 50,
              isSponsored: true,
              fee: 5.99,
            ),
            RestaurantPlate(
              image:
                  'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
              name: 'Nocna Wyżerka',
              score: 4.5,
              minTime: 55,
              maxTime: 75,
              isSponsored: false,
              fee: 9.99,
            ),
          ],
        ),
      ),
    );
  }
}
