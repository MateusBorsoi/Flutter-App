import 'dart:convert';

class GitHubUserModel {
  final int id;
  final String login;
  final String avatarUrl;
  final String? location;
  final String? name;
  final int? followers;
  final int? publicRepos;

  GitHubUserModel(
      {required this.id,
      required this.login,
      required this.avatarUrl,
      this.location,
      this.name,
      this.followers,
      this.publicRepos});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatar_url': avatarUrl,
      'location': location,
      'name': name,
      'followers': followers,
      'public_repos': publicRepos,
    };
  }

  factory GitHubUserModel.fromMap(Map<String, dynamic> map) {
    return GitHubUserModel(
        id: map['id'],
        login: map['login'],
        avatarUrl: map['avatar_url'],
        location: map['location'],
        followers: map['followers'],
        publicRepos: map['public_repos']);
  }
  String toJson() => json.encode(toMap());

  factory GitHubUserModel.fromJson(String source) =>
      GitHubUserModel.fromMap(json.decode(source));
}
