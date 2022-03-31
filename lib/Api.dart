import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../ApiConstants.dart';

// https://api.twilio.com/2010-04-01/Accounts/ACb754fdd9671d70fa05d11c04fba63e2b/Messages.json

void sendMsg(String msg) async {
  try {
    var response = await Dio().post(ApiConstants.baseUrl, data: {'To' : ApiConstants.to, 'From' : ApiConstants.from, 'Body' : msg});
    print(response);
  } catch (e) {
    print(e);
  }
}





