import 'package:appauth/classes/github_user.dart';
import 'package:flutter/material.dart';

class GitHubUserList extends StatefulWidget {
  final GitHubUser user;
  const GitHubUserList({super.key, required this.user});

  @override
  State<GitHubUserList> createState() => _GitHubUserListState();
}

class _GitHubUserListState extends State<GitHubUserList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 50,
        backgroundColor: Theme.of(context).primaryColor,
        child: Padding(
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.user.avatarUrl),
            )),
      ),
      title: Text(
        'Usuário',
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      subtitle: Text(
        widget.user.login,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {},
    );
  }
}
