import 'package:http/http.dart' as http;
// import 'package:ultimate_learning_app/models/post.dart';

import '../models/lessons_exercise.dart';

class RemoteExerciesService {
  Future<List<LessonExercise>?> getExercies(context) async {
    var client = http.Client();
    int contextToIndex;
    switch (context) {
      case "Gaurd Communication":
        // do something
        context = 1;
        break;
      case "Market":
        // do something
        context = 2;
        break;
      case "Sport Complex":
        // do something
        context = 3;
        break;
      case "Classroom":
        // do something
        contextToIndex = 4;
        break;
      case "Food and Drinks":
        // do something
        context = 5;
        break;
    }

    var uri = Uri.parse(
        'http://10.91.57.56:8000/lesson/exercise/1${context.toString()}');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return LessonExerciseFromJson(json);
    }
    return null;
  }
}
