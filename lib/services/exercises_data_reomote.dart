import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// import 'package:ultimate_learning_app/models/post.dart';

import '../models/lessons_exercise.dart';

class RemoteExerciesService {
  Future<List<LessonExercise>?> getExercies(context) async {
    var client = http.Client();
    switch (context) {
      case "Gaurd Communication":
        context = 1;
        break;
      case "Market":
        context = 2;
        break;
      case "Sport Complex":
        context = 3;
        break;
      case "Classroom":
        context = 4;
        break;
      case "Food and Drinks":
        context = 5;
        break;
    }

    var httpClient = HttpClient();

    var uri = Uri.parse(
        'http://10.91.57.56:8000/lesson/exercise/${context.toString()}');

    var request = await httpClient.getUrl(uri);
    var response2 = await request.close();

    if (response2.statusCode == HttpStatus.OK) {
      var json2 = await response2.transform(utf8.decoder).join();
      var data = json.decode(json2);
      return LessonExerciseFromJson(json2);
    }

    return null;
  }
}
