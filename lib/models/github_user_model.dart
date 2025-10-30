class GithubUserModel {
  final String login;
  final String avatarUrl;
  final int publicRepos;
  final int followers;
  final int following;
  final String htmlUrl;

  GithubUserModel({
    required this.login,
    required this.avatarUrl,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.htmlUrl,
  });

  factory GithubUserModel.fromJson(Map<String, dynamic> json) {
    return GithubUserModel(
      login: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      publicRepos: json['public_repos'] ?? 0,
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      htmlUrl: json['html_url'] ?? '',
    );
  }
}
