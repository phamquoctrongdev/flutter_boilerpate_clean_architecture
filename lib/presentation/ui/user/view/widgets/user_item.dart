import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/response/user/user.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../router/app_router.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.userDetail, extra: user.email);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(user.avatar, fit: BoxFit.contain),
          const SizedBox(height: 8.0),
          Text(
            user.firstName,
            style: AppTextStyles.blackSemiNormal,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Container(
            color: Colors.black26,
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
