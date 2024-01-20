import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internshala_search/bloc/internships_bloc.dart';
import 'package:internshala_search/repositories/jobs_repo.dart';
import 'package:internshala_search/screen/home.dart';
import 'package:internshala_search/screen/splesh.screen.dart';
import 'package:internshala_search/utils/response.dart';

import 'models/internship_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(InternshipResponseAdapter());
  Hive.registerAdapter(InternshipAdapter());
  Hive.registerAdapter(StipendAdapter());
  Hive.registerAdapter(LocationAdapter());
  await Hive.openBox<InternshipResponse>('InternshipResponse');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternshipBloc()..add(GetInternshipEvent()),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0, // Ensuring global setting has no elevation
          ),
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //useMaterial3: true,
        ),
        home: SpleshScreen(),
      ),
    );
  }
}
