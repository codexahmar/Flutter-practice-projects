import 'package:covid_tracker/Models/WorldStatsModel.dart';
import 'package:covid_tracker/Services/stats_services.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  late final _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              FutureBuilder<WorldStatsModel>(
                  future: statsServices.fetchWorldStatsApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: Center(
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50.0,
                            controller: _controller,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return Expanded(
                        child: Column(
                          children: [
                            PieChart(
                              dataMap: {
                                "Total": double.parse(
                                    snapshot.data!.cases.toString()),
                                "Recovered": double.parse(
                                    snapshot.data!.recovered.toString()),
                                "Deaths": double.parse(
                                    snapshot.data!.deaths.toString()),
                              },
                              chartType: ChartType.ring,
                              chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3.2,
                              legendOptions: const LegendOptions(
                                  legendPosition: LegendPosition.left),
                              animationDuration:
                                  const Duration(milliseconds: 1200),
                              colorList: colorList,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * .06),
                              child: Card(
                                child: Column(
                                  children: [
                                    ReuseableRow(
                                        title: "Total Cases",
                                        value: snapshot.data!.cases.toString()),
                                    ReuseableRow(
                                        title: "Total Recovered",
                                        value: snapshot.data!.recovered
                                            .toString()),
                                    ReuseableRow(
                                        title: "Total Deaths",
                                        value:
                                            snapshot.data!.deaths.toString()),
                                    ReuseableRow(
                                        title: "Total Active Cases",
                                        value:
                                            snapshot.data!.active.toString()),
                                    ReuseableRow(
                                        title: "Critical",
                                        value:
                                            snapshot.data!.critical.toString()),
                                    ReuseableRow(
                                        title: "Today Deaths",
                                        value: snapshot.data!.todayDeaths
                                            .toString()),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountriesList()));
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1aa260),
                                    borderRadius: BorderRadius.circular(19)),
                                child: const Center(
                                  child: Text("Track Countries"),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;
  const ReuseableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}
