import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsData.dart';

import '../SourceResponse.dart';


class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=dc3d106e730c4256b8c275d9da58d090


  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "dc3d106e730c4256b8c275d9da58d090"});

    http.Response response = await http.get(url);

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);


    SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
    return sourceResponse;
  }


   static Future<NewsDataResponse>getNewsData(String sourceId) async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=dc3d106e730c4256b8c275d9da58d090



      Uri url = Uri.https("newsapi.org", "/v2/everything",
          {"apiKey": "dc3d106e730c4256b8c275d9da58d090",
          "sources":sourceId,
          });

      http.Response response = await http.get(url);

      var jsonFormat = jsonDecode(response.body);


      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
      return newsDataResponse;
    }
  }

