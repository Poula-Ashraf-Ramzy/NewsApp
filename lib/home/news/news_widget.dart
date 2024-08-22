import 'package:flutter/material.dart';
import 'package:news/api/api.dart';
import 'package:news/home/app_color.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/NewsRespones.dart';
import 'package:news/model/SourceResponse.dart';

class NewsWidget extends StatefulWidget {
  Sources source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsRespones?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text("Something went Wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: const Text("Try Agian"))
              ],
            );
          }
          if (snapshot.data!.status == "error") {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: const Text("Try Agian"))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
