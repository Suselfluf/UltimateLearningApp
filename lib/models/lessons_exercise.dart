import 'dart:convert';

List<LessonExercise> LessonExerciseFromJson(String str) =>
    List<LessonExercise>.from(
        json.decode(str).map((x) => LessonExercise.fromJson(x)));

// String LessonExerciseToJson(List<LessonExercise> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonExercise {
  int id;
  ExercisOptions option1;
  ExercisOptions option2;
  ExercisOptions option3;
  ExercisOptions option4;
  Answer answer;
  Context context;

  LessonExercise({
    required this.id,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer,
    required this.context,
  });

  factory LessonExercise.fromJson(Map<String, dynamic> json) => LessonExercise(
      id: json["id"],
      option1: ExercisOptions.fromJson(json['option1']),
      option2: ExercisOptions.fromJson(json['option2']),
      option3: ExercisOptions.fromJson(json['option3']),
      option4: ExercisOptions.fromJson(json['option4']),
      answer: Answer.fromJson(json['answer']),
      context: Context.fromJson(json['context']));

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "option1": option1,
  //     };
}

class ExercisOptions {
//this will handel nested object
  int id;
  String word;
  String meaning;
  // String weight;
  // int context;

  ExercisOptions({
    required this.id,
    required this.word,
    required this.meaning,
    // required this.weight,
    // required this.context,
  });

  factory ExercisOptions.fromJson(Map<String, dynamic> json) {
    // print(utf8.encode(json["word"]));
    // print(json);
    return ExercisOptions(
      id: json['id'],
      word: json['word'],
      meaning: json['meaning'],
      // weight: json['weight'],
      // context: json['context']
    );
  }
}

class Answer {
//this will handel nested object
  int id;
  String word;
  String meaning;
  // String weight;
  // int context;

  Answer({
    required this.id,
    required this.word,
    required this.meaning,
    // required this.weight,
    // required this.context,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      word: json['word'],
      meaning: json['meaning'],
      // weight: json['weight'],
      // context: json['context']
    );
  }
}

class Context {
//this will handel nested object
  int id;
  String context;
  String meaning;
  // String weight;

  Context({
    required this.id,
    required this.context,
    required this.meaning,
    // required this.weight,
  });

  factory Context.fromJson(Map<String, dynamic> json) {
    return Context(
      id: json['id'],
      context: json['context'],
      meaning: json['meaning'],
      // weight: json['weight'],
    );
  }
}
