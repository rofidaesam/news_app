import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


import '../model/SourceResponse.dart';
import '../model/newsresponse.dart';
import 'api_constant.dart';
class ApiManager
{
  // https://newsapi.org/v2/top-headlines/sources?apiKey=87b3dbbec9884526b398a1eea3101747
   static Future<SourceResponse>? getSourcses(String categoryid)async
 {
     Uri url = Uri.https(ApiConstant.baseUrl,

     ApiConstant.sourcesApi,
       {
         'apiKey':'87b3dbbec9884526b398a1eea3101747',
         'categoty':  categoryid,
       }
     );
     Response response = await http.get(url);
     try
     {
       return  SourceResponse.fromJson(jsonDecode(response.body));
     }
    catch(e){
       throw(e);
     }


   }
   //https://newsapi.org/v2/everything?q=bitcoin&apiKey=87b3dbbec9884526b398a1eea3101747
   static Future<NewsResponse?> getNewsBySourceId(String sourceId)async
   {
     Uri url = Uri.https( ApiConstant.baseUrl,ApiConstant.newsApi,
     {
"apikey":'87b3dbbec9884526b398a1eea3101747',
       'sources':sourceId
     }
     );
   var response =  await http.get(url);
   try{
        return NewsResponse.fromJson(jsonDecode(response.body));
         }
     catch(e)
     {
       throw e;
     }

   }


}