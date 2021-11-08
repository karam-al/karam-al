import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SnackBarService {
  snackBar(int statusCode, BuildContext context) {
    if (statusCode == 201 || statusCode == 200) {
      final snackBar =
          SnackBar(content: Text(translator.translate("Added successfully")));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar =
          SnackBar(content: Text(translator.translate("Something went wrong")));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  snackBarImageStatus(BuildContext context) {
    final snackBar = SnackBar(
        content: Text(translator
            .translate("Please Upload Featured / galary image first")));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  snackBarSelectImage(BuildContext context) {
    final snackBar = SnackBar(
        content: Text(translator
            .translate("Please Select Featured / galary images first")));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
