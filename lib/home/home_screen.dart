import 'package:flutter/material.dart';
import 'package:news/home/app_color.dart';
import 'package:news/home/category/category_details.dart';
import 'package:news/home/category/category_fragment.dart';
import 'package:news/home/drawer.dart';
import 'package:news/home/setting/setting_tab.dart';
import 'package:news/model/Category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: AppColor.whiteColor,
        child: Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedMenuItem == HomeDrawer.setting ? "Setting" : "News App",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: Drawer(
          child: HomeDrawer(
            onSideMenuItemClick: onSideMenuItemClick,
          ),
        ),
        body: selectedCategory == HomeDrawer.setting
            ? const SettingTab()
            : selectedCategory == null
                ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                : CategoryDetails(
                    category: selectedCategory!,
                  ),
      )
    ]);
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.setting;

  void onSideMenuItemClick(int newSideMenuItem) {
    selectedMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);

    setState(() {});
  }
}
