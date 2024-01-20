part of 'internships_bloc.dart';



enum InternshipStatus {
  initial,
  loading,
  loaded,
  filteredInternships,
  error,
  connectivityError,
}

class InternshipState extends Equatable {
  final InternshipStatus status;
  final List<Internship> internships;
  final List<Internship> filteredInternships;

  final String? errorMessage;

  InternshipState({
    required this.status,
    required this.internships,
    required this.filteredInternships,
    this.errorMessage,
  });

  factory InternshipState.initial() {
    return InternshipState(status: InternshipStatus.initial, internships: [], filteredInternships: []);
  }

  @override
  List<Object?> get props => [status, internships, filteredInternships,errorMessage];

  @override
  bool get stringify => true;

  InternshipState copyWith({
    InternshipStatus? status,
    List<Internship>? internships,
    List<Internship>? filteredInternships,
    String? errorMessage,
  }) {
    return InternshipState(
      status: status ?? this.status,
      internships: internships ?? this.internships,
      filteredInternships: filteredInternships ?? this.filteredInternships,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
