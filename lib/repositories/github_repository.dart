import '../models/github_user_model.dart';
import '../services/github_service.dart';

class GithubRepository {
  final GithubService _service = GithubService();

  Future<GithubUserModel> getGithubUser(String username) {
    return _service.fetchUser(username);
  }
}
