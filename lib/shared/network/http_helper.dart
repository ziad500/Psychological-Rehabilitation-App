import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  postData({required Map<String, dynamic> data, required String url}) async {
    final String urll = "https://healthmental-you.herokuapp.com/$url";
    final response = await http.post(Uri.parse(urll), body: {data});
    var responseBody = jsonDecode(response.body);
    print(responseBody);
    /* if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }

    /* .then((value) {
      print(json.decode(value.body));
    } */
  } */
  }
}
