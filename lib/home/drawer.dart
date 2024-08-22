import 'package:flutter/material.dart';
import 'package:news/home/app_color.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int setting = 2;
  Function onSideMenuItemClick;

  HomeDrawer({super.key, required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          width: double.infinity,
          color: AppColor.primaryColor,
          child: Text(
            "News App",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onSideMenuItemClick(setting);
              },
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Setting",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
