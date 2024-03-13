import 'package:flags_app/core/models/authentication/user.dart';
import 'package:flags_app/ui/components/default_store_connector.dart';
import 'package:flutter/material.dart';

typedef UserBuilder = Widget Function(BuildContext, User);

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.builder,
    this.replacement,
  });

  final UserBuilder builder;
  final Widget? replacement;

  @override
  Widget build(BuildContext context) {
    return DefaultStoreConnector(
      builder: (_, state) {
        if (state.authState.isLoggedIn) {
          return builder(context, state.authState.user!);
        }
        return replacement ?? const SizedBox.shrink();
      },
    );
  }
}
