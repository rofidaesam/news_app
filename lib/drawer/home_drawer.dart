import 'package:flutter/material.dart';
import 'package:newsapp/app_colors.dart';

class HomeDrawer extends StatelessWidget {
Function onSideMenuItemClick;
static const int categories = 1;
static const int settings = 2;
HomeDrawer({required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Container
         (
         color: AppColors.primaryColor,
         width: double.infinity,
         height: MediaQuery.of(context).size.height*0.18,
         child:Padding(
           padding: const EdgeInsets.all(30),
           child: Text('News app!',textAlign: TextAlign.center,
           style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
         ) ,
       ),
       InkWell(
         onTap: (){

           onSideMenuItemClick(categories);
         },
         child: Row(
           children: [
             Padding(
               padding: const EdgeInsets.all(12),
               child: Icon(Icons.list),
             ),
             Text('Categories',
             style:
               Theme.of(context).textTheme.titleSmall?.copyWith(color:Colors.black),)

           ],
         ),
       ),

       InkWell(
         onTap: (){
           onSideMenuItemClick(settings);
         },
         child: Row(
           children: [
             Padding(
               padding: const EdgeInsets.all(12),
               child: Icon(Icons.settings),
             ),

             Text('Settings',
               style:
               Theme.of(context).textTheme.titleSmall?.copyWith(color:Colors.black))

           ],
         ),
       )

     ],
   );
  }
}
