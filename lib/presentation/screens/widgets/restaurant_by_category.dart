import 'package:flutter/material.dart';

class RestaurantByCategory extends StatelessWidget {
  final String image;
  final String name;
  final bool? isSponsored;
  final double? fee;
  final double score;
  final int minTime;
  final int maxTime;

  const RestaurantByCategory({
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
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fee == 0 ? const Text('No Fee') : Text('$fee zł Fee'),
                  Text('$minTime-$maxTime min'),
                ],
              ),
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
    );
  }
}
