import 'package:flags_app/core/router/navigation_destination.dart';

class NavigateBackAction {
  const NavigateBackAction();
}

class NavigateToNextAction {
  final String path;
  final Object? extra;

  const NavigateToNextAction(this.path, {this.extra});
}

class NavigateGoNextAction {
  final String path;
  final Object? extra;

  const NavigateGoNextAction(this.path, {this.extra});
}

class NavigateToAndReplaceAction {
  final String path;
  final Object? extra;

  const NavigateToAndReplaceAction(this.path, {this.extra});
}

class NavigateToRootAction {
  final String? path;
  final Object? extra;

  const NavigateToRootAction({this.path, this.extra});
}

class ShowDialogAction {
  final bool barrierDismissible;
  final NavigationDestination destination;

  const ShowDialogAction({
    required this.destination,
    this.barrierDismissible = true,
  });
}

class ShowSnackBarAction {
  final String message;

  const ShowSnackBarAction({
    required this.message,
  });
}
