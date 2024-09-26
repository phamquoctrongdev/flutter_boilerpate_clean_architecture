import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_clean_architecture/common/constants/app_strings.dart';
import 'package:flutter_boilerplate_clean_architecture/presentation/ui/widgets/app_bar_view.dart';

import '../../../../common/constants/app_text_styles.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(
        title: AppStrings.kUserDetail,
      ),
      body: Center(
        child: Text(
          text,
          style: AppTextStyles.blackSemiNormal,
        ),
      ),
    );
  }
}
