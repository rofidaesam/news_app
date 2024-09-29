import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/app_colors.dart';
import 'package:newsapp/catagory/catagory_detailes.dart';
import 'package:newsapp/model/catagory.dart';
import 'package:newsapp/settings/settings.dart';
import 'package:newsapp/tabs/tabs_widget.dart';
import '../model/SourceResponse.dart';
import 'catagory/catagory_fragment.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return (Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                  selectedCategory == HomeDrawer.settings
                      ? 'Seetings'
                      : selectedCategory == null
                          ? 'News App'
                          : selectedCategory!.title,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            drawer: Drawer(
              child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
            ),
            body: selectedMenuItem == HomeDrawer.settings
                ? Settings()
                : selectedCategory == null
                    ? CategoryFragment(
                        onCatagoryItemClick: onCatagoryItemClick,
                      )
                    : CatagoryDetailes(category: selectedCategory!))
      ],
    ));
  }

  Catagory? selectedCategory;

  void onCatagoryItemClick(Catagory newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenu) {
    selectedMenuItem = newSideMenu;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
