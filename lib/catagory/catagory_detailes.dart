import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../app_colors.dart';
import '../model/SourceResponse.dart';
import '../model/catagory.dart';
import '../tabs/tabs_widget.dart';

class CatagoryDetailes extends StatefulWidget {

Catagory category;
CatagoryDetailes({required this.category});
  @override
  State<CatagoryDetailes> createState() => _CatagoryDetailesState();
}

class _CatagoryDetailesState extends State<CatagoryDetailes> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSourcses(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('something wrong'),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSourcses(widget.category.id);
                    setState(() {

                    });
                  },
                  child: Text('Try again'),
                )
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSourcses(widget.category.id);
                    setState(() {

                    });
                  },
                  child: Text('Try again'),
                )
              ],
            );
          }
          var sourceList = snapshot.data!.sources!;
          return TabsWidget(sourceList: sourceList);
        }
    );
  }
}
