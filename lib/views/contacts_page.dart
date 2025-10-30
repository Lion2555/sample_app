import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/user_viewmodel.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVm = context.watch<UserViewModel>();

    if (userVm.users.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Контакти'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: const Center(
          child: Text('Немає даних про користувачів.'),
        ),
      );
    }

    final user = userVm.users.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакти'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(user.email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(user.phone),
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: Text(user.linkedIn),
            ),
          ],
        ),
      ),
    );
  }
}
