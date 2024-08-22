import 'package:flutter/material.dart';
import 'package:news/home/app_color.dart';
import 'package:news/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources source;

  TabItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primaryColor, width: 2),
          color: isSelected ? AppColor.primaryColor : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected ? AppColor.whiteColor : AppColor.primaryColor),
      ),
    );
  }
}
