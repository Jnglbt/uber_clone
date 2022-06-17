import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../bloc/cubits/cubits.dart';
import '../../widgets/widgets.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({Key? key}) : super(key: key);

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen>
    with SingleTickerProviderStateMixin {
  bool showBottomMenu = false;

  @override
  Widget build(BuildContext context) {
    CameraPosition cameraPosition =
        const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
    LatLng initialPosition = const LatLng(45.51563, -122.677433);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: initialPosition, zoom: 17),
            zoomControlsEnabled: false,
            compassEnabled: false,
            indoorViewEnabled: true,
            mapToolbarEnabled: false,
            myLocationEnabled: true,
            onCameraIdle: () {},
            onCameraMove: ((position) => cameraPosition = position),
            onMapCreated: (GoogleMapController controller) {},
          ),
          Container(
            height: 70,
            color: showBottomMenu ? Colors.white : Colors.transparent,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: showBottomMenu ? Colors.grey[300] : Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 40,
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Food, Restaurant, etc.',
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: VerticalDivider(
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Icon(
                        Icons.settings,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 72),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Search here',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 72, right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 50,
                width: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Icon(
                    Icons.navigation,
                  ),
                ),
              ),
            ),
          ),
          NotificationListener(
            onNotification: (DraggableScrollableNotification notification) {
              if (notification.extent >= 0.9) {
                setState(() {
                  showBottomMenu = true;
                });
                return true;
              } else {
                setState(() {
                  showBottomMenu = false;
                });
                return true;
              }
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              builder: ((context, scrollController) {
                return ClipRRect(
                  borderRadius: showBottomMenu
                      ? BorderRadius.zero
                      : const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 10.0, right: 10.0),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 6,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        width: 100,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                  ),
                                  BlocBuilder<RestaurantsCubit,
                                      RestaurantsState>(
                                    builder: (context, state) {
                                      if (state is RestaurantsLoading) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (state is RestaurantsLoaded) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: state.restaurants.length,
                                            itemBuilder: ((context, index) {
                                              var value = state
                                                  .restaurants.values
                                                  .elementAt(index);
                                              return RestaurantPlate(
                                                image: value['image'],
                                                name: value['name'],
                                                fee: value['fee'],
                                                score: value['score'],
                                                minTime: value['minTime'],
                                                maxTime: value['maxTime'],
                                                isSponsored:
                                                    value['isSponsored'],
                                              );
                                            }),
                                          ),
                                        );
                                      } else {
                                        return const Text(
                                            'Something went wrong');
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
