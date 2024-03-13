import 'package:flags_app/ui/modals/about_dialog.dart';
import 'package:flags_app/ui/modals/info_dialog.dart';
import 'package:flags_app/ui/modals/loading_dialog.dart';
import 'package:flutter/material.dart' hide NavigationDestination, AboutDialog;

abstract class NavigationDestination {
  final Key? key;

  const NavigationDestination({this.key});

  Widget builder(BuildContext context);
}

class LoadingDialogDestination extends NavigationDestination {
  const LoadingDialogDestination({super.key});

  @override
  Widget builder(BuildContext context) => const LoadingDialog();
}

class AboutDialogDestination extends NavigationDestination {
  const AboutDialogDestination({super.key});

  @override
  Widget builder(BuildContext context) => const AboutDialog();
}

class InfoDialogDestination extends NavigationDestination {
  const InfoDialogDestination({
    super.key,
    required this.title,
    required this.message,
    this.onTap,
    this.onCancel,
  });

  final String title;
  final String message;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  @override
  Widget builder(BuildContext context) => InfoDialog(
        key: key,
        title: title,
        message: message,
        onTap: onTap,
        onCancel: onCancel,
      );
}
