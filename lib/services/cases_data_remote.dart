import 'package:http/http.dart' as http;
import 'package:ultimate_learning_app/models/post.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('http://10.91.57.56:8000/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}
