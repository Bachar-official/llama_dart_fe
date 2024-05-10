import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/entity/snackbar_reason.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    {required ManagerDeps deps,
    required SnackBarReason reason,
    required String message}) {
  deps.scaffoldKey.currentState!.showSnackBar(
    SnackBar(
      backgroundColor: reason.getReasonColor(),
      content: Text(message),
    ),
  );
}
