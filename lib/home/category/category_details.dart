import 'package:flutter/material.dart';
import 'package:news/api/api.dart';
import 'package:news/home/app_color.dart';
import 'package:news/home/taps/tabs_widget.dart';
import 'package:news/model/Category.dart';
import 'package:news/model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
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
                      ApiManager.getSources(widget.category.id);
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
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: const Text("Try Agian"))
              ],
            );
          }
          var sourcesList = snapshot.data!.sources!;
          return TabsWidget(sourcesList: sourcesList);
        });
  }
}
