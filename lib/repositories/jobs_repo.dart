import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/internship_model.dart';
import '../utils/response.dart';

class JobsRepository {
  final String url = 'https://internshala.com/flutter_hiring/search';

  Future<Response> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        return Response(
            isSuccess: true,
            internshipResponse: InternshipResponse.fromJson(jsonResponse),
            error: "");
      } else {
        //throw Exception(jsonDecode(response.body));
        return Response(
            isSuccess: false,
            internshipResponse: InternshipResponse(internships: []),
            error: "error");
      }
    } catch (e) {
      if (e is http.ClientException) {
        //throw Exception('Network issues: ${e.toString()}');
        return Response(
            isSuccess: false,
            internshipResponse: InternshipResponse(internships: []),
            error: 'Network issues: ${e.toString()}');
      } else if (e is FormatException) {
        return Response(
            isSuccess: false,
            internshipResponse: InternshipResponse(internships: []),
            error: 'Data format error: ${e.toString()}');
      } else {
        return Response(
            isSuccess: false,
            internshipResponse: InternshipResponse(internships: []),
            error: 'An error occurred:  ${e.toString()}');
      }
    }
  }

  List<Internship> searchInternships(
      String? query, List<Internship> internships) {
    if (query == null || query.isEmpty) {
      return internships;
    }

    query = query
        .toLowerCase();
    return internships.where((internship) {
      bool matchesCompanyName =
          internship.companyName.toLowerCase().contains(query!);
      bool matchesTitle = internship.title.toLowerCase().contains(query);

      bool matchesLocation = internship.locations.any((location) =>
          location.name.toLowerCase().contains(query!) ||
          location.country.toLowerCase().contains(query) ||
          location.region.toLowerCase().contains(query));

      return matchesCompanyName ||
          matchesTitle ||
          matchesLocation;
    }).toList();
  }

  List<Internship> searchInternshipsByTitles(
      List<Internship> internships, List<String> titles) {
    if (titles == null || titles.isEmpty) {
      return internships;
    }


    log("internships length " + internships.length.toString());

    log(titles.toString());
    var l = internships
        .where((internship) => titles.contains(internship.title))
        .toList();
    log("search Internships By Titles " + l.length.toString() + l.toString());

    return internships
        .where((internship) => titles.contains(internship.title))
        .toList();
  }

  List<Internship> searchInternshipsByCompanyName(
      List<Internship> internships, List<String> companyName) {
    if (companyName == null || companyName.isEmpty) {
      return internships;
    }
    log("internships length " + internships.length.toString());

    log(companyName.toString());
    var l = internships
        .where((internship) => companyName.contains(internship.companyName))
        .toList();
    log("search Internships By CompanyName " +
        l.length.toString() +
        l.toString());

    // Filter the internships where the title matches any of the given titles

    return internships
        .where((internship) => companyName.contains(internship.companyName))
        .toList();
  }

  List<Internship> searchInternshipsByLocationNames(
      List<Internship> internships, List<String> locationNames) {
    if (locationNames == null || locationNames.isEmpty) {
      return internships;
    }

    log("Internships length: " + internships.length.toString());
    log("Location names: " + locationNames.toString());

    var lowerCaseLocationNames = locationNames.map((name) => name.toLowerCase()).toList();

    var filteredInternships = internships.where((internship) =>
        internship.locations.any((location) =>
            lowerCaseLocationNames.contains(location.name.toLowerCase())))
        .toList();

    log("Filtered internships by Location Names count: " +
        filteredInternships.length.toString());

    return filteredInternships;
  }

  List<Internship> filterWorkFromHomeInternships(List<Internship> internships) {
    return internships.where((internship) => internship.workFromHome).toList();
  }



  List<String> getCitiesFromInternships(List<Internship> internships) {
    return internships
        .expand((internship) => internship.locations)
        .map((location) => location.name)
        .toList();
  }
}
