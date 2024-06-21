import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/ui/widgets/app_bar_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/user_notifier.dart';
import 'widgets/user_item.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProvider);
    return Scaffold(
      appBar: const AppBarView(title: 'List of users'),
      body: Builder(
        builder: (context) {
          if (!state.hasValue) {
            return const SizedBox();
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = state.requireValue.users;
          if (users.isEmpty) {
            return const Center(
              child: Text('Oops... Data not found!!!'),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return UserItem(user: users[index]);
            },
            itemCount: users.length,
          );
        },
      ),
    );
  }
}
