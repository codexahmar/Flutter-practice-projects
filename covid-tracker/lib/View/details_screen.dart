import 'package:covid_tracker/View/world_stats.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailsScreen(
      {required this.name,
      required this.image,
      required this.critical,
      required this.active,
      required this.test,
      required this.todayRecovered,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.06,),
                      ReuseableRow(
                          title: "Total Cases", value: widget.totalCases.toString()),
                      ReuseableRow(
                          title: "Total Active Cases", value: widget.active.toString()),
                      ReuseableRow(
                          title: "Total Deaths", value: widget.totalDeaths.toString()),
                      ReuseableRow(
                          title: "Critical", value: widget.critical.toString()),
                      ReuseableRow(
                          title: "Today Recovered", value: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
