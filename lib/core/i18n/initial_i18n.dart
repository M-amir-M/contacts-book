import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadJsonFromAsset(language) async {
  return await rootBundle.loadString('assets/i18n/' + language + '.json');
}

Map<String, String> convertObjectToMap(obj) {
  Map<String, String> result = {};
  obj.forEach((key, value) {
    result[key] = value.toString();
  });
  return result;
}
