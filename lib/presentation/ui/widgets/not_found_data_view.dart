import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';

class NotFoundDataView extends StatelessWidget {
  const NotFoundDataView({
    super.key,
    this.textColor,
  });

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.kNotFoundData,
        style: AppTextStyles.blackSemiBigger,
      ),
    );
  }
}
