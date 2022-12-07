import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// import 'package:ultimate_learning_app/models/post.dart';

import '../models/lessons_exercise.dart';
import '../models/vocabulary_data.dart';

class RemoteVocabularyService {
  Future<List<VocabularyData>?> getVocabulary() async {
    var result;
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.91.57.56:8000/dictionary/get/'));
    request.fields.addAll({'email': 'testuser@mail.ru'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream
          .bytesToString()
          .then((value) => {result = VocabularyDataFromJson(value)});
      return result;
    } else {
      print(response.reasonPhrase);
    }

    return null;
  }

  Future<List<VocabularyData>?> addWordToVocabulary(word) async {
    print(word);
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.91.57.56:8000/dictionary/save/'));
    request.fields.addAll({'user': 'testuser@mail.ru', "word": word});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) => {print(value)});
    } else {
      print(response.reasonPhrase);
    }

    return null;
  }
}
