import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19app/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic data = ApiData().fetchGlobal(),
      countryData = ApiData().fetchPkrStats();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //stats container
  Widget globalStats(
      String location, recover, death, confirm, lastCheck, lastReported) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * .9
          : MediaQuery.of(context).size.width * .86,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * .4
          : MediaQuery.of(context).size.height * .64,
      decoration: BoxDecoration(
        color: Color(0xff444444),
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                "$location",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffDA0037),
                ),
                maxLines: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            "$confirm",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDA0037),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Active\nCases",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffEDEDED),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            "$recover",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDA0037),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Recovered\nCases",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffEDEDED),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            "$death",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDA0037),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Death\nToll",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffEDEDED),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            "$lastCheck",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDA0037),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Last\nChecked",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffEDEDED),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            "$lastReported",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDA0037),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Last\nReported",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffEDEDED),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget countryStats(
    dynamic snapshot,
  ) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * .9
          : MediaQuery.of(context).size.width * .86,
      decoration: BoxDecoration(
        color: Color(0xff444444),
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 14.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                snapshot[0]['country'],
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffDA0037),
                ),
                maxLines: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * .9
                        : MediaQuery.of(context).size.width * .86,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * .4
                        : MediaQuery.of(context).size.height * .4,
                padding: EdgeInsets.only(
                  top: 14.0,
                  right: 14.0,
                  left: 14.0,
                ),
                child: ListView.builder(
                  itemCount: snapshot.length,
                  itemBuilder: (context, i) {
                    return Container(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * .9
                          : MediaQuery.of(context).size.width * .86,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * .18
                          : MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                        color: Color(0xffDA0037),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  snapshot[i]['province'].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                    color: Color(0xffEDEDED),
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: AutoSizeText(
                                            snapshot[i]['confirmed'].toString(),
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff171717),
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          "Active\nCases",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xffEDEDED),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: AutoSizeText(
                                            snapshot[i]['recovered'].toString(),
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff171717),
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          "Recovered\nCases",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xffEDEDED),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: AutoSizeText(
                                            snapshot[i]['deaths'].toString(),
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff171717),
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          "Death\nToll",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xffEDEDED),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      appBar: AppBar(
        backgroundColor: Color(0xffDA0037),
        title: Text(
          "Covid-19 Statistics",
          style: TextStyle(
            color: Color(0xffEDEDED),
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 6.0,
          bottom: 15.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: globalStats(
                            (snapshot.data as Map)['location'],
                            (snapshot.data as Map)['recovered'],
                            (snapshot.data as Map)['deaths'],
                            (snapshot.data as Map)['confirmed'],
                            (snapshot.data as Map)['lastChecked']
                                .substring(0, 10),
                            (snapshot.data as Map)['lastReported']
                                .substring(0, 10),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffDA0037),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: countryData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        bottom: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          countryStats(
                            (snapshot.data as Map)['covid19Stats'],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffDA0037),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
