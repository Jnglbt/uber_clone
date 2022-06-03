import 'package:flutter/material.dart';

class RestaurantPlate extends StatelessWidget {
  final String image;
  final String name;
  final bool? isSponsored;
  final double? fee;
  final double score;
  final int minTime;
  final int maxTime;

  const RestaurantPlate({
    Key? key,
    required this.image,
    required this.name,
    this.isSponsored = false,
    this.fee = 0,
    required this.score,
    required this.minTime,
    required this.maxTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            height: 150,
            width: double.maxFinite,
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        isSponsored == true
                            ? const Text(
                                'Sponsored',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              )
                            : Container(),
                        isSponsored == true
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                            : Container(),
                        fee == 0 ? const Text('No Fee') : Text('$fee zł Fee'),
                        const Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              '.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Text('$minTime-$maxTime min'),
                      ],
                    ),
                  ],
                ),
              ),
              score >= 4.8
                  ? const Icon(
                      Icons.tour_sharp,
                      size: 30,
                    )
                  : Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text('$score')),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
