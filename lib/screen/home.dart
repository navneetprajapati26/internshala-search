import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/jobs_bloc.dart';
import '../widgets/Shimmer.dart';
import '../widgets/filters_banner.dart';
import '../widgets/internships_card.dart';
import '../widgets/internships_lists.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          onChanged: (value) {
            context.read<InternshipBloc>().add(SearchInternshipsEvent(value));
          },
          decoration: const InputDecoration(
            hintText: 'Search internships...',
            border: InputBorder.none,
          ),
        ),
        elevation: 0,
      ),
      body: BlocConsumer<InternshipBloc, InternshipState>(
        listener: (context, state) {
          // TODO: Implement listener
        },
        builder: (context, state) {
          log(state.toString());

          switch (state.status) {
            case InternshipStatus.loading:
              //return const Center(child: CircularProgressIndicator());
              return ShimmerScreen();
            case InternshipStatus.loaded:
              return Column(
                children: [
                  FiltersWidget(state.internships.length.toString()),

                  InternshipsLists(
                    internships: state.internships!,
                  ),
                ],
              );

            case InternshipStatus.filteredInternships:
              return Column(
                children: [
                  FiltersWidget(state.filteredInternships.length.toString()),
                  InternshipsLists(
                    internships: state.filteredInternships!,
                  ),
                ],
              );
            case InternshipStatus.error:
              return Center(
                child: Text(
                  state.errorMessage ?? "Error occurred",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            case InternshipStatus.connectivityError:
              return const Center(
                child: Text(
                  "No Connectivity",
                  style: TextStyle(color: Colors.red),
                ),
              );

            default:
              return const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(color: Colors.green),
                ),
              );
          }
        },
      ),
    );
  }
}
