import 'package:flutter/material.dart';
import 'package:newsapp/app_colors.dart';

import '../model/SourceResponse.dart';

class TabsItem extends StatelessWidget {

bool isSelected;
Sources source;
TabsItem({required this.isSelected,required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration
        (
        borderRadius:BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2
        )  ,
        color: isSelected?AppColors.primaryColor:Colors.transparent,
      ),


      child:
      Text(source.name??'',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
    color: isSelected?AppColors.WhiteColor:AppColors.primaryColor
    )
      )
    );
  }
}
