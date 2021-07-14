import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19app/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final searchQuery = TextEditingController();
final _formKey = GlobalKey<FormState>();

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  dynamic data;

  Future getStats() {
    data = ApiData().fetchCountryStats(searchQuery.text);
    return data;
  }

  //searchBar widget
  Widget searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        initialValue: null,
        autocorrect: true,
        controller: searchQuery,
        validator: (query) {
          if (query!.isEmpty) {
            return 'Enter country to search!';
          } else {
            return null;
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardAppearance: Brightness.dark,
        keyboardType: TextInputType.name,
        style: TextStyle(
          color: Color(0xffEDEDED),
          fontSize: 20.0,
          decoration: TextDecoration.none,
        ),
        textInputAction: TextInputAction.next,
        cursorColor: Color(0xffEDEDED),
        cursorWidth: 2.0,
        cursorHeight: 26.0,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 14.0,
          ),
          errorStyle: TextStyle(
            fontSize: 15.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEDEDED), width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDA0037), width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          border: InputBorder.none,
          hintText: 'Search country for stats...',
          hintStyle: TextStyle(
            color: Color(0xffEDEDED),
            fontSize: 16.0,
          ),
          suffixIcon: Container(
            height: 56.0,
            width: 58.0,
            decoration: BoxDecoration(
              color: Color(0xffDA0037),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    data = null;
                  });
                  getStats();
                }
              },
              icon: Icon(Icons.search),
              color: Color(0xffEDEDED),
              iconSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }

  //country status
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
                        ? MediaQuery.of(context).size.height * .6
                        : MediaQuery.of(context).size.height * .7,
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
                          : MediaQuery.of(context).size.height * .34,
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
          title: AutoSizeText(
            "Search",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: searchBar(),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder(
                        future: data,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return countryStats(
                              (snapshot.data as Map)['covid19Stats'],
                            );
                          } else if (data == null) {
                            return SizedBox(
                              height: 0.0,
                            );
                          } else {
                            return CircularProgressIndicator(
                              color: Color(0xffDA0037),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
