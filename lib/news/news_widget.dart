import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/model/newsresponse.dart';
import 'package:newsapp/news/news_item.dart';

import '../app_colors.dart';
import '../model/SourceResponse.dart';
import '../tabs/tabs_widget.dart';

class NewsWidget extends StatefulWidget {

Sources source;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<NewsResponse?>(future: ApiManager.getNewsBySourceId(widget.source.id??''),
        builder: (context,snapshot)
    {
      if(snapshot.connectionState== ConnectionState.waiting )
        return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
    else if (snapshot.hasError) {
      return Column(
        children: [
          Text('something wrong'),
          ElevatedButton(
            onPressed: () {
              ApiManager.getNewsBySourceId(widget.source.id??'');
            },
            child: Text('Try again'),
          )
        ],
      );
    }
    if (snapshot.data!.status != 'ok') {
      return Column(
        children: [
          Text(snapshot.data!.message!),
          ElevatedButton(
            onPressed: () {
              ApiManager.getNewsBySourceId(widget.source.id??'');
            },
            child: Text('Try again'),
          )
        ],
      );
    }
    var newsList = snapshot.data!.articles!;
    return ListView.builder(itemBuilder: (context,index){
      return NewsItem(n: newsList[index]);
    },
    itemCount: newsList.length,);

    {

    }
    }
    ) ;
        }
}

