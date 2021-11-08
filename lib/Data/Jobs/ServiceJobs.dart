import 'package:http/http.dart' as http;

import 'AutoGenertedJobs.dart';

class ServiceJobs {
  Future<List<JobsParse>> getPosts(int x) async {
    final queryParameters = {
      'jobs-category': '$x',
    };
    var url = Uri.https('oxydu.com', '/wp-json/wp/v2/jobs', queryParameters); 
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) { 
        final List<JobsParse> listPosts = jobsParseFromJson(response.body); 
        return listPosts;
      } else {
        return <JobsParse>[];
      }
    } catch (e) {
      return <JobsParse>[];
    }
  }
}
