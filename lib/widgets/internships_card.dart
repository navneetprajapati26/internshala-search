import 'package:flutter/material.dart';

import '../models/internship_model.dart';
// class Location {
//   final String name;
//   final String country;
//
//   Location({required this.name, required this.country});
// }

class InternshipsCard extends StatelessWidget {
  final String title;
  final String company;
  final List<Location> locations; // List of locations
  final String stipend;
  final String time;

  InternshipsCard({
    super.key,
    required this.title,
    required this.company,
    required this.locations, // Updated to accept locations
    required this.stipend,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    // Generate the location string
    String locationString = formatLocations(locations);


    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4, left: 12, right: 12),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              activelyHiring(),
              SizedBox(height: 9),
              titleAndCompany(title: title, company: company),
              SizedBox(height: 18),
              logoAndText(icon: Icons.location_on, text: locationString), // Use locationString
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: logoAndText(icon: Icons.play_circle_outline, text: "Starts Immediately")),
                  Expanded(child: logoAndText(icon: Icons.timer, text: time)),
                ],
              ),
              SizedBox(height: 18),
              logoAndText(icon: Icons.monetization_on_rounded, text: stipend),
              SizedBox(height: 18),
              internship(),
              SizedBox(height: 18),
              fewHoursAgo(),
            ],
          ),
        ),
      ),
    );
  }
  Widget activelyHiring() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min, // To ensure it doesn't take more space than it needs
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.timeline_rounded, color: Colors.blue, size: 17),
            SizedBox(width: 5),
            Text(
              "Actively hiring",
              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget internship() {
    return Container(
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(
          "Internship",
          style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget fewHoursAgo() {
    return Container(
      width: 123,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Row(
          mainAxisSize: MainAxisSize.min, // To ensure it doesn't take more space than it needs
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.watch_later_outlined, color: Colors.green, size: 17),
            SizedBox(width: 5),
            Text(
              "Few hours ago",
              style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget logoAndText({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 17),
        SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget titleAndCompany({required String title, required String company}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text(company, style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            ],
          ),
        ),
        FlutterLogo(size: 50), // This can be replaced with your company logo
      ],
    );
  }

  String formatLocations(List<Location> locations) {
    if (locations.isEmpty) {
      return 'Work from home';
    }
    return locations.map((loc) => "${loc.name}").join(', ');
  }
}
