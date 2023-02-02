import 'package:flutter/material.dart';

class GlobalMethods {
 

  void showLoader(BuildContext ctx, bool showLoader) {
    if (showLoader) {
      showDialog(
          barrierDismissible: false,
          context: ctx,
          builder: (ctx) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    } else {
      Navigator.of(ctx).pop();
    }
  }
}
