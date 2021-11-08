// To parse this JSON data, do
//
//     final jobsParse = jobsParseFromJson(jsonString);

import 'dart:convert';

List<JobsParse> jobsParseFromJson(String str) => List<JobsParse>.from(json.decode(str).map((x) => JobsParse.fromJson(x)));

String jobsParseToJson(List<JobsParse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobsParse {
    JobsParse({
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

    factory JobsParse.fromJson(Map<String, dynamic> json) => JobsParse(
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
        this.careerLevel,
        this.employmentType,
        this.minimumWorkExperience,
        this.minEduclev,
        this.monthlySalary,
        this.listedBy,
        this.specialties,
        this.tradeLicense,
        this.industry,
        this.companySize,
        this.contactName,
        this.phoneNumberAmHiring,
        this.addressAmHiring,
        this.titleCompany,
        this.descriptionCompa,
        this.companyWebsite,
        this.galleryAmHiring,
        this.descriptionAmHiring,
        this.benefits,
        this.skill1,
        this.skill2,
        this.skill3,
        this.skill4,
        this.skill5,
        this.whatFood,
        this.what039STheCorrectAnswer,
        this.locationjobs,
        this.listAWrongAnswer,
        this.listAnotherWrongAnswer,
        this.where039STheJobBased,
    });

    String careerLevel;
    String employmentType;
    String minimumWorkExperience;
    String minEduclev;
    String monthlySalary;
    String listedBy;
    String specialties;
    String tradeLicense;
    String industry;
    String companySize;
    String contactName;
    String phoneNumberAmHiring;
    String addressAmHiring;
    String titleCompany;
    String descriptionCompa;
    String companyWebsite;
    bool galleryAmHiring;
    String descriptionAmHiring;
    String benefits;
    String skill1;
    String skill2;
    String skill3;
    String skill4;
    String skill5;
    String whatFood;
    String what039STheCorrectAnswer;
    String locationjobs;
    String listAWrongAnswer;
    String listAnotherWrongAnswer;
    String where039STheJobBased;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        careerLevel: json["career-level"],
        employmentType: json["employment-type"],
        minimumWorkExperience: json["minimum-work-experience"],
        minEduclev: json["min-educlev"],
        monthlySalary: json["monthly-salary"],
        listedBy: json["listed-by"],
        specialties: json["specialties-"],
        tradeLicense: json["trade-license"],
        industry: json["industry"],
        companySize: json["company-size"],
        contactName: json["contact-name"],
        phoneNumberAmHiring: json["phone-number-am-hiring"],
        addressAmHiring: json["address-am-hiring"],
        titleCompany: json["title-company"],
        descriptionCompa: json["description-compa"],
        companyWebsite: json["company-website"],
        galleryAmHiring: json["gallery-am-hiring"],
        descriptionAmHiring: json["description_am_hiring"],
        benefits: json["benefits"],
        skill1: json["skill-1"],
        skill2: json["skill-2"],
        skill3: json["skill-3"],
        skill4: json["skill-4"],
        skill5: json["skill-5"],
        whatFood: json["what-food"],
        what039STheCorrectAnswer: json["what039s-the-correct-answer"],
        locationjobs: json["locationjobs"],
        listAWrongAnswer: json["list-a-wrong-answer"],
        listAnotherWrongAnswer: json["list-another-wrong-answer"],
        where039STheJobBased: json["where039s-the-job-based"],
    );

    Map<String, dynamic> toJson() => {
        "career-level": careerLevel,
        "employment-type": employmentType,
        "minimum-work-experience": minimumWorkExperience,
        "min-educlev": minEduclev,
        "monthly-salary": monthlySalary,
        "listed-by": listedBy,
        "specialties-": specialties,
        "trade-license": tradeLicense,
        "industry": industry,
        "company-size": companySize,
        "contact-name": contactName,
        "phone-number-am-hiring": phoneNumberAmHiring,
        "address-am-hiring": addressAmHiring,
        "title-company": titleCompany,
        "description-compa": descriptionCompa,
        "company-website": companyWebsite,
        "gallery-am-hiring": galleryAmHiring,
        "description_am_hiring": descriptionAmHiring,
        "benefits": benefits,
        "skill-1": skill1,
        "skill-2": skill2,
        "skill-3": skill3,
        "skill-4": skill4,
        "skill-5": skill5,
        "what-food": whatFood,
        "what039s-the-correct-answer": what039STheCorrectAnswer,
        "locationjobs": locationjobs,
        "list-a-wrong-answer": listAWrongAnswer,
        "list-another-wrong-answer": listAnotherWrongAnswer,
        "where039s-the-job-based": where039STheJobBased,
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
