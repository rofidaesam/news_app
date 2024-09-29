import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app_colors.dart';

import '../model/catagory.dart';
import 'catagory_item.dart';

class CategoryFragment extends StatefulWidget {
  Function onCatagoryItemClick;
  CategoryFragment({required this.onCatagoryItemClick});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  var categoriesList = Catagory.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Pick Your Category \n of interest',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.black),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        widget.onCatagoryItemClick(categoriesList[index]);
                        setState(() {});
                      },
                      child: CetegoryItem(
                          category: categoriesList[index], index: index));
                },
                itemCount: categoriesList.length),
          )
        ],
      ),
    );
  }
}
