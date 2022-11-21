import 'dart:core';
import 'package:flutter/material.dart';
import '../../modules/webView/web_view.dart';


Widget List(news,context)=> InkWell(
  child:  Padding(
      padding: const EdgeInsetsDirectional.all(20.0),
      child: Row(
        children: [
          Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage('${news['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      '${news['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${news['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
  onTap: (){
    Navigator.push(context, MaterialPageRoute (
      builder: (BuildContext context) =>Webview(news['url']),
    ),);
  },
);
