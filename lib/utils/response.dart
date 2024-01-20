import '../models/internship_model.dart';

class Response {
  final bool isSuccess;
  final InternshipResponse internshipResponse;
  final String error;

  Response({
    required this.isSuccess,
    required this.internshipResponse,
    required this.error,
  });
}
