import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'Post.dart';

/*class Services {

   var  url = Uri.http('www.json-generator.com','/api/json/get/cfnRWfGGeW',{"indent":"2"});
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

}*/

class Services {
  /* var url = Uri.http(
      'www.json-generator.com', '/api/json/get/bVgzIdyusy', {"indent": "2"});*/

  // var url = Uri.https('api.json-generator.com', '/templates/-p32CLNEtLsN/data');

  // https://api.json-generator.com/templates/WC1QZ5OYiOgc/data
  //https://api.json-generator.com/templates/WC1QZ5OYiOgc/data

  /*static const String url =
      "http://www.json-generator.com/api/json/get/bVgzIdyusy?indent=2";
 */
  //'http://www.json-generator.com/api/json/get/bVmXkGGZAi?indent=2';

  //'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8';

  //'http://www.json-generator.com/api/json/get/cfOoQyCkqG?indent=2';

  // 'http://www.json-generator.com/api/json/get/bOtoDGRSUO?indent=2';

  Future<List<Post>> getPosts(int x) async {
    final queryParameters = {
      'motors-type': '$x',
    };
    var url = Uri.https('oxydu.com', '/wp-json/wp/v2/motors', queryParameters);

    //Dio dio = new Dio();

    try {
      /////////////
      /*final response = await dio.get('https://oxydu.com/wp-json/wp/v2/motors',
     queryParameters:{
       'motors-type' : '$x'
     });*/
      //////////////
      /*final response = await http.get(url, headers: {
        'Authorization': 'Bearer ef7jjv78bt16lmerqohowjwxbwassyfs2tf4ufds'
      });*/
      ///////////////
      final response = await http.get(url);
      //3ejt83z2wpucusnyvj8tkm1nbfyeusz38qe7s4np
      //ef7jjv78bt16lmerqohowjwxbwassyfs2tf4ufds
      if (response.statusCode == 200) {
          print(response.body); 
        final List<Post> listPosts = postFromJson(response.body); 
          
        return listPosts;
      } else {
        return <Post>[];
      }
    } catch (e) {
      return <Post>[];
    }
  }
}
