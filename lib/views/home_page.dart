import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/user_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.watch<UserViewModel>().users;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список людей'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Text(
                user.name.split(' ').map((e) => e[0]).take(2).join(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(user.name),
            subtitle: Text(user.profession),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.go('/details/${user.id}'),
          );
        },
      ),
    );
  }
}
