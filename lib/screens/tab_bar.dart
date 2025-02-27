import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/screens/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex=0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        var sources = snapshot.data?.sources ?? [];
        return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,

                  onTap: (value) {
                    selectedTabIndex=value;

                    setState(() {

                    });
                  },
                  tabs: sources
                      .map((e) => TabItem(
                    source:e,
                    isSelected: sources.elementAt(selectedTabIndex)==e,
                  ))
                      .toList()),
            ));
      },
    );
  }
}
