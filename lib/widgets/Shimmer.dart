import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, // Number of shimmer items
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ShimmerItem(),
        ),
      ),
    );
  }
}

class ShimmerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 20, color: Colors.white),
            SizedBox(height: 8),
            Container(height: 15, color: Colors.white),
            SizedBox(height: 8),
            Container(height: 15, color: Colors.white),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(child: Container(height: 15, color: Colors.white)),
                SizedBox(width: 10),
                Expanded(child: Container(height: 15, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
