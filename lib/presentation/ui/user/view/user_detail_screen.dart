import 'package:flutter/material.dart';

import '../../../../core/constants/app_text_styles.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text,
          style: AppTextStyles.blackSemiNormal,
        ),
      ),
    );
  }
}
