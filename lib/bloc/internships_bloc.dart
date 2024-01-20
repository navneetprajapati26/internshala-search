import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../models/internship_model.dart';
import '../repositories/jobs_repo.dart';
import '../utils/response.dart';

part 'internships_event.dart';
part 'internships_state.dart';

class InternshipBloc extends Bloc<InternshipEvent, InternshipState> {
  JobsRepository jobsRepository = JobsRepository();

  InternshipBloc() : super(InternshipState.initial()) {
    on<InternshipEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetInternshipEvent>(_onGetInternship);
    on<SearchInternshipsEvent>(_onSearchInternships);
    on<SearchByTitleInternshipsEvent>(_onSearchByTitleInternships);
    on<SearchByCompanyNameInternshipsEvent>(_onSearchByCompanyNameInternships);
    on<SearchByLocationNamesInternshipsEvent>(
        _onSearchByLocationNamesInternships);
    on<SearchByWorkFromHomeInternshipsEvent>(
        _onSearchByWorkFromHomeInternships);
    on<EmptyFilterInternshipEvent>(_onEmptyFilterInternship);
  }
  final internshipBox = Hive.box<InternshipResponse>('InternshipResponse');

  Future<void> _onGetInternship(
      GetInternshipEvent event, Emitter<InternshipState> emit) async {
    emit(state.copyWith(status: InternshipStatus.loading));
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Check if the Hive box has data
      if (internshipBox.isNotEmpty) {
        log("-----------");
        // Retrieve the first InternshipResponse from the box
        final InternshipResponse? internship =
            internshipBox.getAt(0); // Assuming the first entry is what you need
        emit(state.copyWith(
          status: InternshipStatus.loaded,
          internships: internship!.internships,
        ));
        return;
      } else {
        emit(state.copyWith(status: InternshipStatus.connectivityError));
        return;
      }
    }

    try {
      Response response = await jobsRepository
          .fetchBlogs(); // Assuming this is the correct method
      if (response.isSuccess == true) {
        // Save the fetched internships to the Hive box for offline access
        internshipBox.put(
            'InternshipResponse',
            response
                .internshipResponse); // You can use a specific key or an index

        emit(state.copyWith(
          status: InternshipStatus.loaded,
          internships: response.internshipResponse.internships,
        ));
      } else {
        emit(state.copyWith(
          status: InternshipStatus.error,
          errorMessage: response.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: InternshipStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onSearchInternships(
      SearchInternshipsEvent event, Emitter<InternshipState> emit) {
    if (event.query != null && event.query.isNotEmpty) {
      final filteredInternships = jobsRepository.searchInternships(
          event.query, state.internships ?? []);
      log(filteredInternships.length.toString());
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    } else {
      emit(state.copyWith(status: InternshipStatus.loaded));
    }
  }

  void _onSearchByTitleInternships(
      SearchByTitleInternshipsEvent event, Emitter<InternshipState> emit) {
    if (state.filteredInternships.isNotEmpty) {
      log("filteredInternships state length " +
          state.filteredInternships.length.toString());
      final filteredInternships = jobsRepository.searchInternshipsByTitles(
          state.filteredInternships ?? [], event.titles);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    } else {
      log("internships state length " + state.internships.length.toString());
      final filteredInternships = jobsRepository.searchInternshipsByTitles(
          state.internships ?? [], event.titles);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    }
  }

  void _onSearchByCompanyNameInternships(
      SearchByCompanyNameInternshipsEvent event,
      Emitter<InternshipState> emit) {
    if (state.filteredInternships.isNotEmpty) {
      log("filteredInternships state length " +
          state.filteredInternships.length.toString());

      final filteredInternships = jobsRepository.searchInternshipsByCompanyName(
          state.filteredInternships ?? [], event.companyName);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    } else {
      log("internships state length " + state.internships.length.toString());

      final filteredInternships = jobsRepository.searchInternshipsByCompanyName(
          state.internships ?? [], event.companyName);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    }
  }

  void _onSearchByLocationNamesInternships(
      SearchByLocationNamesInternshipsEvent event,
      Emitter<InternshipState> emit) {
    if (state.filteredInternships.isNotEmpty) {
      //log("filteredInternships state length " + state.filteredInternships.length.toString());

      final filteredInternships =
          jobsRepository.searchInternshipsByLocationNames(
              state.filteredInternships ?? [], event.locationNames);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    } else {
      //log("internships state length " + state.internships.length.toString());

      final filteredInternships =
          jobsRepository.searchInternshipsByLocationNames(
              state.internships ?? [], event.locationNames);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    }
  }

  void _onSearchByWorkFromHomeInternships(
      SearchByWorkFromHomeInternshipsEvent event,
      Emitter<InternshipState> emit) {
    if (state.filteredInternships.isNotEmpty) {
      //log("filteredInternships state length " + state.filteredInternships.length.toString());

      final filteredInternships = jobsRepository
          .filterWorkFromHomeInternships(state.filteredInternships ?? []);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    } else {
      //log("internships state length " + state.internships.length.toString());

      final filteredInternships =
          jobsRepository.filterWorkFromHomeInternships(state.internships ?? []);
      emit(state.copyWith(
          status: InternshipStatus.filteredInternships,
          filteredInternships: filteredInternships));
    }
  }

  void _onEmptyFilterInternship(
      EmptyFilterInternshipEvent event, Emitter<InternshipState> emit) {
    emit(state
        .copyWith(status: InternshipStatus.loaded, filteredInternships: []));
  }
}
