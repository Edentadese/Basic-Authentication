import "dart:convert";

import "package:eco/constants/utils.dart";
import "package:flutter/cupertino.dart";
import "package:http/http.dart" as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showCustomDialog(context, jsonDecode(response.body)['msg'], false);
      break;
    case 500:
      showCustomDialog(context, jsonDecode(response.body)['error'], false);
      break;
    default:
      showCustomDialog(context, jsonDecode(response.body), true);
      break;
    

  }
}
