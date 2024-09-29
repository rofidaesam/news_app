import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class MyThemeData
{
  static final ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(

          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight:  Radius.circular(30),
              )
          )
      ),

      primaryColor: AppColors.primaryColor,
      textTheme: TextTheme(
        titleMedium:  GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color:AppColors.WhiteColor

        ),)
  );
}