import 'package:flutter/material.dart';

import '../models/internship_model.dart';
import 'internships_card.dart';
class InternshipsLists extends StatelessWidget {
  final List<Internship> internships;
  const InternshipsLists({super.key,required this.internships});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: internships?.length ?? 0,
          itemBuilder: (context, index) {
            final internship = internships![index];
            return InternshipsCard(
              title: internship.title,
              company: internship.companyName,
              locations: internship.locations, // Pass the entire list of locations
              stipend: internship.stipend.salary,
              time: internship.duration,
            );
          }),
    );;
  }
}
