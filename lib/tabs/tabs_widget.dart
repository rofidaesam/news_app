import 'package:flutter/material.dart';
import 'package:newsapp/news/news_widget.dart';
import 'package:newsapp/tabs/tabs_item.dart';

import '../model/SourceResponse.dart';

class TabsWidget extends StatefulWidget {
List<Sources> sourceList;

TabsWidget({ required this.sourceList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          
            children: [
              TabBar(
                onTap: (index){
          index = selectedIndex;
          setState(() {
          
          });
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
          
                tabs:
                  widget.sourceList.map((source)=>TabsItem(
              source:source,
            isSelected: selectedIndex== widget.sourceList.indexOf(source),
          )
                  ).toList()
                  ),
              Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex]))
            ],
          ),

    );
  }
}
