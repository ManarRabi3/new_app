
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsData.dart';
//import 'package:news_c11_friday/models/NewsData.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         ClipRRect(
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(25),topRight: Radius.circular(25)
),


             
             child: Image.network(article.urlToImage ??"",
             height: 240,)),
          Text(
            article.author ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black54),
          ),
          Text(
            article.title ?? "",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            article.description ?? "",
            maxLines: 3,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
          Text(
            article.publishedAt!.substring(0, 10) ?? "",
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
