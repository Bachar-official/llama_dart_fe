import 'package:flutter/material.dart';

enum SnackBarReason {
  error,
  success,
  warning;

  Color getReasonColor() {
    switch (this) {
      case SnackBarReason.error:
        return Colors.red;
      case SnackBarReason.success:
        return Colors.green;
      case SnackBarReason.warning:
        return Colors.yellow;
    }
  }
}
