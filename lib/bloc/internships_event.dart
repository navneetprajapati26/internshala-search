part of 'internships_bloc.dart';

abstract class InternshipEvent {}

class GetInternshipEvent extends InternshipEvent {}

class SearchInternshipsEvent extends InternshipEvent {
  final String query;
  SearchInternshipsEvent(this.query);
}

class SearchByTitleInternshipsEvent extends InternshipEvent {
  final List<String> titles;
  SearchByTitleInternshipsEvent(this.titles);
}

class SearchByCompanyNameInternshipsEvent extends InternshipEvent {
  final List<String> companyName;
  SearchByCompanyNameInternshipsEvent(this.companyName);
}

class SearchByLocationNamesInternshipsEvent extends InternshipEvent {
  final List<String> locationNames;
  SearchByLocationNamesInternshipsEvent(this.locationNames);
}

class SearchByWorkFromHomeInternshipsEvent extends InternshipEvent {
  final bool isWorkFromHome;
  SearchByWorkFromHomeInternshipsEvent(this.isWorkFromHome);
}


class EmptyFilterInternshipEvent extends InternshipEvent {}
