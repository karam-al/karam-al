import 'package:dio/dio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/constants.dart';

class NotesServiceJobs {
  static const headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvb3h5ZHUuY29tIiwiaWF0IjoxNjM1NjY3Nzg0LCJuYmYiOjE2MzU2Njc3ODQsImV4cCI6MTYzNjI3MjU4NCwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMSJ9fX0.zNSI2jDA7NSrfYuyQYz0ohf5CX0PyQ4ZpOeHYZ7Q5d4'
    //'Content-Type': 'application/json'
  };

  iAmHiring(
      dynamic api,
      dynamic companyName,
      dynamic tradeLicense,
      dynamic industry,
      dynamic companySize,
      dynamic description,
      dynamic descriptionSecond,
      dynamic contractName,
      dynamic phoneNumber,
      dynamic address,
      dynamic companyWebSite,
      dynamic jobTitle,
      dynamic careerLevel,
      dynamic employmentType,
      dynamic minimumWorkExp,
      dynamic education,
      dynamic skill1,
      dynamic skill2,
      dynamic skill3,
      dynamic skill4,
      dynamic skill5,
      dynamic monthlySalary,
      dynamic benefits,
      dynamic year,
      dynamic month,
      dynamic day,
      dynamic listedBy,
      dynamic foodDoseBanana,
      dynamic theCorrectAnswer,
      dynamic listWrongAnswer,
      dynamic listAnotherWrongAnswer,
      dynamic whereIsTheJobsBased,
      dynamic location,
      dynamic specialties) {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'jobs-category': '$api',
      "title": "$jobTitle",
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      "fields[title-company]": "$companyName",
      "fields[trade-license]": "$tradeLicense",
      "fields[industry]": "$industry",
      "fields[company-size]": "$companySize",
      "fields[description-compa]": "$description",
      "fields[contact-name]": "$contractName",
      "fields[phone-number-am-hiring]": "$phoneNumber",
      "fields[address-am-hiring]": "$address",
      "fields[company-website]": "$companyWebSite",
      "fields[description_am_hiring]": "$descriptionSecond",
      "fields[career-level]": "$careerLevel",
      "fields[minimum-work-experience]": "$minimumWorkExp",
      "fields[min-educlev]": "$education",
      "fields[monthly-salary]": "$monthlySalary",
      "fields[benefits]": "$benefits",
      "fields[skill-1]": "$skill1",
      "fields[skill-2]": "$skill2",
      "fields[skill-3]": "$skill3",
      "fields[skill-4]": "$skill4",
      "fields[skill-5]": "$skill5",
      "fields[listed-by]": "$listedBy",
      "fields[expires-on": '$year-$month-$day',
      "fields[what-food]": "$foodDoseBanana",
      "fields[what039s-the-correct-answer]": "$theCorrectAnswer",
      "fields[locationjobs]": "$location",
      "fields[list-a-wrong-answer]": "$listWrongAnswer",
      "fields[list-another-wrong-answer]": "$listAnotherWrongAnswer",
      "fields[where039s-the-job-based]": "$whereIsTheJobsBased",
      "fields[specialties-]": "$specialties",
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/jobs', data: FormData.fromMap(a));
  }

  jobsWanted(
      dynamic api,
      dynamic title,
      dynamic specialties,
      dynamic description,
      dynamic gender,
      dynamic nationality,
      dynamic location,
      dynamic company,
      dynamic position,
      dynamic period,
      dynamic visa,
      dynamic career,
      dynamic unspecified,
      dynamic experience,
      dynamic education,
      dynamic commitment,
      dynamic where,
      dynamic location2) {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'job-wanted-categories': '$api',
      'title': "$title",
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'fields[specialties-want]': '$specialties',
      'fields[description-want]': '$description',
      'fields[gender-want]': '$gender',
      'fields[nationality-want]': '$nationality',
      'fields[current-location-want-]': '$location',
      'fields[current-company-want]': '$company',
      'fields[current-position-want]': '$position',
      'fields[notice-period-want-]': '$period',
      'fields[visa-status-want]': '$visa',
      'fields[career-level-want]': '$career',
      'fields[unspecified-want]': '$unspecified',
      'fields[work-experience-want]': '$experience',
      'fields[education-level-want]': '$education',
      'fields[commitment-want]': '$commitment',
      'fields[where-would-you-like-to-work-want]': '$where',
      'fields[location-want]': '$location2',
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/want-job',
        data: FormData.fromMap(a));
  }
}
