import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../ApiConstants.dart';

// https://api.twilio.com/2010-04-01/Accounts/ACb754fdd9671d70fa05d11c04fba63e2b/Messages.json

// void sendMsg(String msg) async {
//   try {
//     var response = await Dio().post(ApiConstants.baseUrl,
//         data: {'To': ApiConstants.to, 'From': ApiConstants.from, 'Body': msg},
//         options: Options(headers: {
//           'Authorization':
//               'Basic e3tUV0lMSU9fQUNDT1VOVF9TSUR9fTp7e1RXSUxJT19BVVRIX1RPS0VOfX0=',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         }));

//     print(response);
//   } catch (e) {
//     print(e);
//   }

void sendMsg1(String msg) async {
  var headers = {
    'Authorization': 'Basic e3tUV0lMSU9fQUNDT1VOVF9TSUR9fTp7e1RXSUxJT19BVVRIX1RPS0VOfX0=',
  'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = http.Request(
      'POST',
      Uri.parse('https://api.twilio.com/2010-04-01/Accounts/ACb754fdd9671d70fa05d11c04fba63e2b/Messages.json'));
  request.bodyFields = {
    'To': '+6598326613',
    'Body': 'Sent from Postman! 20220401_1',
    'MediaURL':
        'https://media2.giphy.com/media/huyZxIJvtqVeRp7QcS/giphy.gif?cid=790b761119b1e53a9064b1794092ad611691032a4716108c&rid=giphy.gif&ct=g',
    'From': '+17579796397'
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  print('status code = ${response.statusCode}');

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
  return;
}
