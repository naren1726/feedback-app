import 'dart:convert' as convert;
import 'package:feedback/model/model.dart';
import 'package:http/http.dart' as http;

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL = "script.google.com";
  static const String PATH =
      "macros/s/AKfycbwTGBeWQ1_p0KdN3HLLvAK8Evly2NYF3RSkkgVmtaQHauJEeNMYV84HtpK0Io0CfXjh/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      Uri uri = Uri.https(URL, PATH, feedbackForm.toMap());
      print(uri.toString());

      await http.get(uri).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          uri = Uri.tryParse(url);
          await http.get(uri).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
