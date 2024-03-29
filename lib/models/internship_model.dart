import 'package:hive/hive.dart';

part 'internship_model.g.dart';
 // Generated by Hive generator

@HiveType(typeId: 0)
class InternshipResponse extends HiveObject {
  @HiveField(0)
  List<Internship> internships;

  InternshipResponse({required this.internships});

  factory InternshipResponse.fromJson(Map<String, dynamic> json) {
    var internshipsJson = json["internships_meta"] as Map<String, dynamic>;
    List<Internship> internships = internshipsJson.values.map((x) => Internship.fromJson(x)).toList();
    return InternshipResponse(internships: internships);
  }
}

@HiveType(typeId: 1)
class Internship extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String employmentType;
  @HiveField(3)
  String companyName;
  @HiveField(4)
  bool workFromHome;
  @HiveField(5)
  String startDate;
  @HiveField(6)
  String duration;
  @HiveField(7)
  Stipend stipend;
  @HiveField(8)
  List<Location> locations;

  Internship({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.companyName,
    required this.workFromHome,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.locations,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json["id"] ?? 0,
      title: json["title"] ?? "N/A",
      employmentType: json["employment_type"] ?? "N/A",
      companyName: json["company_name"] ?? "N/A",
      workFromHome: json["work_from_home"] ?? false,
      startDate: json["start_date"] ?? "N/A",
      duration: json["duration"] ?? "N/A",
      stipend: Stipend.fromJson(json["stipend"] ?? {}),
      locations: (json["locations"] as List).map((x) => Location.fromJson(x)).toList(),
    );
  }
}

@HiveType(typeId: 2)
class Stipend extends HiveObject {
  @HiveField(0)
  String salary;
  @HiveField(1)
  String currency;
  @HiveField(2)
  String scale;

  Stipend({required this.salary, required this.currency, required this.scale});

  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      salary: json["salary"] ?? "0",
      currency: json["currency"] ?? "N/A",
      scale: json["scale"] ?? "N/A",
    );
  }
}

@HiveType(typeId: 3)
class Location extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String country;
  @HiveField(2)
  String region;

  Location({required this.name, required this.country, required this.region});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["locationName"] ?? "Unknown",
      country: json["country"] ?? "Unknown",
      region: json["region"] ?? "Unknown",
    );
  }
}
