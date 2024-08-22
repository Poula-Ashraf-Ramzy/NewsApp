import 'package:flutter/material.dart';
import 'package:news/home/news/news_widget.dart';
import 'package:news/home/taps/tab_item.dart';
import 'package:news/model/SourceResponse.dart';

class TabsWidget extends StatefulWidget {
  List<Sources> sourcesList;

  TabsWidget({super.key, required this.sourcesList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sourcesList
                    .map((source) => TabItem(
                        source: source,
                        isSelected: selectedIndex ==
                            widget.sourcesList.indexOf(source)))
                    .toList()),
            Expanded(
                child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
