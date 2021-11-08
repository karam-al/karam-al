// To parse this JSON data, do
//
//     final jobsWantedParse = jobsWantedParseFromJson(jsonString);

import 'dart:convert';

List<JobsWantedParse> jobsWantedParseFromJson(String str) => List<JobsWantedParse>.from(json.decode(str).map((x) => JobsWantedParse.fromJson(x)));

String jobsWantedParseToJson(List<JobsWantedParse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobsWantedParse {
    JobsWantedParse({
        this.id,
        this.date,
        this.dateGmt,
        this.title,
        this.lang,
        this.acf,
    });

    int id;
    DateTime date;
    DateTime dateGmt;
    Title title;
    String lang;
    Acf acf;

    factory JobsWantedParse.fromJson(Map<String, dynamic> json) => JobsWantedParse(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        title: Title.fromJson(json["title"]),
        lang: json["lang"],
        acf: Acf.fromJson(json["acf"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "title": title.toJson(),
        "lang": lang,
        "acf": acf.toJson(),
    };
}

class Acf {
    Acf({
        this.specialtiesWant,
        this.descriptionWant,
        this.genderWant,
        this.nationalityWant,
        this.currentLocationWant,
        this.currentCompanyWant,
        this.currentPositionWant,
        this.noticePeriodWant,
        this.visaStatusWant,
        this.careerLevelWant,
        this.unspecifiedWant,
        this.workExperienceWant,
        this.educationLevelWant,
        this.commitmentWant,
        this.whereWouldYouLikeToWorkWant,
        this.locationWant,
    });

    String specialtiesWant;
    String descriptionWant;
    String genderWant;
    String nationalityWant;
    String currentLocationWant;
    String currentCompanyWant;
    String currentPositionWant;
    String noticePeriodWant;
    String visaStatusWant;
    String careerLevelWant;
    String unspecifiedWant;
    String workExperienceWant;
    String educationLevelWant;
    String commitmentWant;
    String whereWouldYouLikeToWorkWant;
    String locationWant;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        specialtiesWant: json["specialties-want"],
        descriptionWant: json["description-want"],
        genderWant: json["gender-want"],
        nationalityWant: json["nationality-want"],
        currentLocationWant: json["current-location-want-"],
        currentCompanyWant: json["current-company-want"],
        currentPositionWant: json["current-position-want"],
        noticePeriodWant: json["notice-period-want-"],
        visaStatusWant: json["visa-status-want"],
        careerLevelWant: json["career-level-want"],
        unspecifiedWant: json["unspecified-want"],
        workExperienceWant: json["work-experience-want"],
        educationLevelWant: json["education-level-want"],
        commitmentWant: json["commitment-want"],
        whereWouldYouLikeToWorkWant: json["where-would-you-like-to-work-want"],
        locationWant: json["location-want"],
    );

    Map<String, dynamic> toJson() => {
        "specialties-want": specialtiesWant,
        "description-want": descriptionWant,
        "gender-want": genderWant,
        "nationality-want": nationalityWant,
        "current-location-want-": currentLocationWant,
        "current-company-want": currentCompanyWant,
        "current-position-want": currentPositionWant,
        "notice-period-want-": noticePeriodWant,
        "visa-status-want": visaStatusWant,
        "career-level-want": careerLevelWant,
        "unspecified-want": unspecifiedWant,
        "work-experience-want": workExperienceWant,
        "education-level-want": educationLevelWant,
        "commitment-want": commitmentWant,
        "where-would-you-like-to-work-want": whereWouldYouLikeToWorkWant,
        "location-want": locationWant,
    };
}

class Title {
    Title({
        this.rendered,
    });

    String rendered;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}
