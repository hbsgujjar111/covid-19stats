import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ApiData {
  fetchPkrStats() async {
    var response = await http.get(
      Uri.parse(
          'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=Pakistan'),
      headers: {
        'X-RapidAPI-Key': '984a2438f9msh8baafb549a82066p1cc753jsn823c92b99a33',
        'x-rapidapi-host': 'covid-19-coronavirus-statistics.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['data'];
    }
  }

  fetchCountryStats(String country) async {
    var response = await http.get(
      Uri.parse(
          'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=$country'),
      headers: {
        'X-RapidAPI-Key': '984a2438f9msh8baafb549a82066p1cc753jsn823c92b99a33',
        'x-rapidapi-host': 'covid-19-coronavirus-statistics.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['data'];
    }
  }

  fetchGlobal() async {
    var response = await http.get(
      Uri.parse(
          'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/total'),
      headers: {
        'X-RapidAPI-Key': '984a2438f9msh8baafb549a82066p1cc753jsn823c92b99a33',
        'x-rapidapi-host': 'covid-19-coronavirus-statistics.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['data'];
    }
  }
}
