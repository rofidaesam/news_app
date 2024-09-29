import 'package:flutter/material.dart';

import '../model/catagory.dart';

class CetegoryItem extends StatelessWidget {
  Catagory category;
  int index;
  CetegoryItem({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              bottomRight: Radius.circular(index % 2 != 0 ? 25 : 0),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.center,
            category.title,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
