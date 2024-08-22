import 'package:flutter/material.dart';
import 'package:news/model/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0),
              bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0)),
          color: category.color),
      child: Column(
        children: [
          Image.asset(category.imagePath,
              height: MediaQuery.of(context).size.height * 0.17),
        ],
      ),
    );
  }
}
