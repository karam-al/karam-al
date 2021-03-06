 
import 'package:http/http.dart' as http;

import 'AutoGeneratedOffers.dart'; 

class ServiceOffers { 
  Future<List<OffersParse>> getPosts(int x) async {
    final queryParameters = {
      'offers-categories': '$x',
    };
    var url = Uri.https('oxydu.com', '/wp-json/wp/v2/offers', queryParameters);

    //Dio dio = new Dio();

    try { 
      final response = await http.get(url); 
      if (response.statusCode == 200) {
          print(response.body); 
        final List<OffersParse> listPosts = offersParseFromJson(response.body); 
          
        return listPosts;
      } else {
        return <OffersParse>[];
      }
    } catch (e) {
      return <OffersParse>[];
    }
  }
}
