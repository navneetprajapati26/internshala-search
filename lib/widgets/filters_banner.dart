import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_search/bloc/jobs_bloc.dart';
import 'package:internshala_search/screen/filter_screen.dart';

class FiltersWidget extends StatelessWidget {

  final String numOfInternships;


  FiltersWidget( this.numOfInternships);

  @override
  Widget build(BuildContext context) {
    // Random number generator
    final random = Random();


    double randomDouble(double min, double max) =>
        min + random.nextDouble() * (max - min);


    List<Widget> generateBackgroundIcons(double width, int rowCount, int columnCount) {
      List<Widget> icons = [];
      double rowHeight = 80 / rowCount;
      double columnWidth = width / columnCount;

      for (var row = 0; row < rowCount; row++) {
        for (var col = 0; col < columnCount; col++) {
          icons.add(Positioned(
            top: row * rowHeight,
            left: col * columnWidth,
            child: Opacity(
              opacity: randomDouble(0.1, 0.25), // Random opacity
              child: Transform.rotate(
                angle: randomDouble(0, 2 * pi), // Random rotation
                child: Icon(Icons.filter_alt_outlined,
                    color: Colors.blue.withOpacity(0.5), size: 30),
              ),
            ),
          ));
        }
      }
      return icons;
    }

    double containerWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 85,
        width: containerWidth,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ...generateBackgroundIcons(
                containerWidth, 3, 8),

            // Centered content
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          // context
                          //     .read<InternshipBloc>()
                          //     .add(EmptyFilterInternshipEvent());
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FilterScreen(
                          )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            color: Colors.blue.withOpacity(.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.filter_alt_outlined,
                                    color: Colors.blue, size: 17),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "Add Filters",
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
                      SizedBox(width: 10,),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          context
                              .read<InternshipBloc>()
                              .add(EmptyFilterInternshipEvent());

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            color: Colors.blue.withOpacity(.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.filter_alt_outlined,
                                    color: Colors.blue, size: 17),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "Remove Filters",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 2,bottom: 5),
                    child: BlocBuilder<InternshipBloc, InternshipState>(
                      builder: (context, state) {
                        return Text(
                          //"${state.internships!.length} total internships",
                          "${numOfInternships} total internships",
                          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
