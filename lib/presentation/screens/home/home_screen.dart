import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/bloc/cubits/cubits.dart';

import '../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  BlocBuilder<DeliveryTypeCubit, DeliveryTypeState>(
                    builder: (context, state) {
                      return TabBar(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: MediaQuery.of(context).size.width / 3.5,
                          right: MediaQuery.of(context).size.width / 3.5,
                        ),
                        indicatorColor: Colors.transparent,
                        labelPadding: const EdgeInsets.all(0),
                        controller: tabController,
                        onTap: (index) {
                          if (index == 0) {
                            BlocProvider.of<DeliveryTypeCubit>(context)
                                .getNavBarItem(DeliveryType.delivery);
                          } else if (index == 1) {
                            BlocProvider.of<DeliveryTypeCubit>(context)
                                .getNavBarItem(DeliveryType.pickup);
                          }
                        },
                        tabs: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: tabController.index == 0
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Delivery',
                                style: TextStyle(
                                  color: tabController.index == 0
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: tabController.index == 1
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Pickup',
                                style: TextStyle(
                                  color: tabController.index == 1
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Now',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: const Text(
                                  '.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            const Text(
                              'Some street address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(child: DeliveryScreen()),
                        PickupScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
