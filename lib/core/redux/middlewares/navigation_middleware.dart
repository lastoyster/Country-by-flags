import 'package:flags_app/core/redux/actions/navigation_action.dart';
import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  final GoRouter goRouter;
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationMiddleware({
    required this.goRouter,
    required this.navigatorKey,
  });

  BuildContext get context => navigatorKey.currentContext!;

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    switch (action.runtimeType) {
      case NavigateToNextAction:
        _onNavigateToNextAction(store, action);
        break;
      case NavigateGoNextAction:
        _onNavigateGoNextAction(store, action);
        break;
      case NavigateToAndReplaceAction:
        _onNavigateToAndReplaceAction(store, action);
        break;
      case NavigateBackAction:
        _onNavigateBackAction(store, action);
        break;
      case NavigateToRootAction:
        _onNavigateToRootAction(store, action);
        break;
      case ShowDialogAction:
        _onShowDialogAction(store, action);
        break;
      case ShowSnackBarAction:
        _onShowSnackBarAction(store, action);
        break;
    }

    next(action);
  }

  void _onNavigateToNextAction(
    Store<AppState> store,
    NavigateToNextAction action,
  ) =>
      goRouter.push(action.path, extra: action.extra);

  void _onNavigateGoNextAction(
    Store<AppState> store,
    NavigateGoNextAction action,
  ) =>
      goRouter.go(action.path, extra: action.extra);

  void _onNavigateToAndReplaceAction(
    Store<AppState> store,
    NavigateToAndReplaceAction action,
  ) =>
      goRouter.pushReplacement(action.path, extra: action.extra);

  void _onNavigateBackAction(
    Store<AppState> store,
    NavigateBackAction action,
  ) =>
      Navigator.of(context).pop();

  void _onShowDialogAction(
    Store<AppState> store,
    ShowDialogAction action,
  ) =>
      showDialog(
        context: context,
        barrierDismissible: action.barrierDismissible,
        builder: action.destination.builder,
      );

  void _onShowSnackBarAction(
    Store<AppState> store,
    ShowSnackBarAction action,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(action.message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onNavigateToRootAction(
    Store<AppState> storxpe,
    NavigateToRootAction action,
  ) async {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacement(
      action.path ?? '/',
      extra: action.extra,
    );
  }
}
