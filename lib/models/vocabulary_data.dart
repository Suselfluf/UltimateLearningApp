import 'dart:convert';

List<VocabularyData> VocabularyDataFromJson(String str) =>
    List<VocabularyData>.from(
        json.decode(str).map((x) => VocabularyData.fromJson(x)));

// String VocabularyDataToJson(List<VocabularyData> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VocabularyData {
  int id;
  VocabularyOwner vocabularyOwner;
  VocabularyWord vocabularyWord;
  String date_updated;

  VocabularyData({
    required this.id,
    required this.vocabularyOwner,
    required this.vocabularyWord,
    required this.date_updated,
  });

  factory VocabularyData.fromJson(Map<String, dynamic> json) => VocabularyData(
        id: json["id"],
        vocabularyOwner: VocabularyOwner.fromJson(json['user']),
        vocabularyWord: VocabularyWord.fromJson(json['word']),
        date_updated: json['time_added'],
      );
}

class VocabularyOwner {
//this will handel nested object
  String email;
  String name;
  String password;

  VocabularyOwner({
    required this.email,
    required this.name,
    required this.password,
  });

  factory VocabularyOwner.fromJson(Map<String, dynamic> json) {
    return VocabularyOwner(
      email: json['email'],
      name: json['name'],
      password: json['password'],
    );
  }
}

class VocabularyWord {
//this will handel nested object
  int id;
  String word;
  String meaning;
  // String weight;
  // int context;

  VocabularyWord({
    required this.id,
    required this.word,
    required this.meaning,
  });

  factory VocabularyWord.fromJson(Map<String, dynamic> json) {
    return VocabularyWord(
      id: json['id'],
      word: json['word'],
      meaning: json['meaning'],
    );
  }
}
