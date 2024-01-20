import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/jobs_bloc.dart';
import '../models/internship_model.dart';
import '../widgets/custom_dropdown_search.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<InternshipBloc, InternshipState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdownSearch(
                      titel: "Title",
                      items: state.internships!
                          .map((internship) => internship.title)
                          .toSet()
                          .toList(),
                      onChanged: (value) {
                        // print(value);
                        // List<Internship> l = state.internships!.where((internship) => value.contains(internship.title)).toList();

                        context
                            .read<InternshipBloc>()
                            .add(SearchByTitleInternshipsEvent(value));
                        log(state.filteredInternships!.length.toString());
                      },
                    ),
                    CustomDropdownSearch(
                      titel: "Company",
                      items: state.internships!
                          .map((internship) => internship.companyName)
                          .toSet()
                          .toList(),
                      onChanged: (value) {
                        // print(value);
                        // List<Internship> l = state.internships!.where((internship) => value.contains(internship.companyName)).toList();
                        // log(l.length.toString());

                        context
                            .read<InternshipBloc>()
                            .add(SearchByCompanyNameInternshipsEvent(value));
                        log(state.filteredInternships!.length.toString());
                      },
                    ),
                    CustomDropdownSearch(
                      titel: "City",
                      items: state.internships!
                          .expand((internship) => internship.locations)
                          .map((location) => location.name)
                          .toSet()
                          .toList(),
                      onChanged: (value) {
                        // List<Internship> l = state.internships!.where((internship) =>
                        //     internship.locations.any((location) => value.contains(location.name))
                        // ).toList();
                        // log(l.length.toString());

                        context
                            .read<InternshipBloc>()
                            .add(SearchByLocationNamesInternshipsEvent(value));
                        log(state.filteredInternships!.length.toString());
                      },
                    ),
                    SizedBox(height: 20,),
                    CheckboxListTile(
                      title: Text("Work From Home Internships"),
                      value: isChecked,
                      onChanged: (bool? value) {
                        if(value == true){
                          context
                              .read<InternshipBloc>()
                              .add(SearchByWorkFromHomeInternshipsEvent(value!));
                        }
                        setState(() {
                          isChecked = value!;
                        });


                      },
                    ),
                    SizedBox(height: 20,),
                    CupertinoButton(
                      //padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          color: Colors.blue.withOpacity(.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Padding(
                          padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.filter_alt_outlined,
                                  color: Colors.blue, size: 17),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Text(
                                  "Apply yours filters",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        //floatingActionButton: FloatingActionButton(child: Text("Apply"),onPressed: (){}),
        // bottomNavigationBar: ButtonBar(
        //   children: [
        //
        //     //
        //   ],
        // )
    );
  }
}
