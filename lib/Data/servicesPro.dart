import 'package:http/http.dart' as http;

import 'PostPro.dart';
 

class Servicess {
 //  var  url = Uri.http('www.json-generator.com','/api/json/get/cfnRWfGGeW',{"indent":"2"});
     var  url = Uri.http('www.oxydu.linkgroupsy.com','/linkgroupsy/Oxydusub/wp-json/wp/v2/jobs');

  //static const String url ="http://www.json-generator.com/api/json/get/cfnRWfGGeW?indent=2";
  
  //'http://www.json-generator.com/api/json/get/bVmXkGGZAi?indent=2';
  
  //'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8';
  
  //'http://www.json-generator.com/api/json/get/cfOoQyCkqG?indent=2';
  
  // 'http://www.json-generator.com/api/json/get/bOtoDGRSUO?indent=2';

   Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Post> listPosts = postFromJson(response.body);
        return listPosts;
      } else {return <Post>[];
      }
    } catch (e) {
      return <Post>[];
    }
  }

}
