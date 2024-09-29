import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app_colors.dart';

import '../model/newsresponse.dart';

class NewsItem extends StatelessWidget {
  news n;
  NewsItem({required this.n});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: CachedNetworkImage(
                imageUrl: n.urlToImage ?? "",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(n.author ?? "",style: Theme.of(context).textTheme.titleSmall?.copyWith(color:AppColors.grayColor),
            ),
            SizedBox(height: 10,),
            Text(
              n.title ?? '',
            ),
            SizedBox(height: 10,),
            Text(
              n.publishedAt ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.grayColor),
              textAlign: TextAlign.end,
            ),
          ],
        ));
  }
}
