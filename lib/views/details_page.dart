import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/user_viewmodel.dart';

class DetailsPage extends StatelessWidget {
  final String userId;
  const DetailsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserViewModel>().getUserById(userId);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Text(
                user.name.split(' ').map((e) => e[0]).take(2).join(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(user.profession, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(user.about, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text('Email: ${user.email}'),
            Text('Телефон: ${user.phone}'),
            Text('LinkedIn: ${user.linkedIn}'),
          ],
        ),
      ),
    );
  }
}
