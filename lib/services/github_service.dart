import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/github_user_model.dart';

class GithubService {
  Future<GithubUserModel> fetchUser(String username) async {
    final url = Uri.parse('https://api.github.com/users/$username');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return GithubUserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Не вдалося отримати дані користувача');
    }
  }
}
