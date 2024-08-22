import 'package:flutter/material.dart';
import 'package:news/home/app_color.dart';

class Category {
  String id;

  String imagePath;
  Color color;

  Category({required this.id, required this.color, required this.imagePath});

  static List<Category> getCategories() {
    return [
      Category(
          id: "sports",
          color: AppColor.redColor,
          imagePath: "assets/images/sports.png"),
      Category(
          id: "general",
          color: AppColor.darkBlueColor,
          imagePath: "assets/images/politics.png"),
      Category(
          id: "health",
          color: AppColor.pinkColor,
          imagePath: "assets/images/health.png"),
      Category(
          id: "business",
          color: AppColor.brownColor,
          imagePath: "assets/images/business.png"),
      Category(
          id: "entertainment",
          color: AppColor.blueColor,
          imagePath: "assets/images/enviroment.png"),
      Category(
          id: "science",
          color: AppColor.redColor,
          imagePath: "assets/images/science.png"),
      // Category(
      //     title: "Technology",
      //     id: "technology",
      //     color: AppColor.darkBlueColor,
      //     imagePath: "assets/images/technology.png"),
    ];
  }
}
