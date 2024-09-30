import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_clean_architecture/common/constants/app_strings.dart';
import 'package:flutter_boilerplate_clean_architecture/presentation/ui/common/screen_util_mixin.dart';
import 'package:flutter_boilerplate_clean_architecture/presentation/ui/widgets/app_bar_view.dart';
import 'package:flutter_boilerplate_clean_architecture/presentation/ui/widgets/loading_mask.dart';
import 'package:flutter_boilerplate_clean_architecture/presentation/ui/widgets/not_found_data_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/user_controller.dart';
import 'widgets/user_item.dart';

class UserScreen extends ConsumerWidget with ScreenUtilMixin {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProvider);
    ref.listen(
      userProvider,
      (pre, next) {
        if (next.hasError) {
          showError(context, exception: next.error);
        }
      },
    );
    return Scaffold(
      appBar: const AppBarView(
        title: AppStrings.kUsers,
        isDisplayBack: false,
      ),
      body: LoadingMask(
        isDisplayLoading: state.isLoading,
        child: Builder(
          builder: (context) {
            if (!state.hasValue) {
              return const SizedBox();
            }
            final users = state.requireValue.users;
            if (users.isEmpty) {
              return const NotFoundDataView();
            }
            return ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemBuilder: (context, index) {
                return UserItem(user: users[index]);
              },
              itemCount: users.length,
            );
          },
        ),
      ),
    );
  }
}
