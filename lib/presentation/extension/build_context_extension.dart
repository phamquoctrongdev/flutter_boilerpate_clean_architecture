import 'package:flutter/material.dart';

import '../../presentation/ui/dialogs/app_alert_dialog.dart';

extension BuildContextExtension on BuildContext {
  void showErrorDialog(String message) {
    showDialog(
      context: this,
      builder: (context) {
        return AppAlertDialog(
          message: message,
        );
      },
    );
  }
}
