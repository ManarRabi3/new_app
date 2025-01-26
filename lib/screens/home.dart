import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = "Home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          var sources = snapshot.data?.sources ?? [];

          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(sources[index].name ?? "");
            },
            itemCount: sources.length,
          );
        },
      ),
    );
  }
}
