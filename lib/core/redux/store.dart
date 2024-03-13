import 'package:flags_app/core/redux/middlewares/app_middleware.dart';
import 'package:flags_app/core/redux/middlewares/authentication_middleware.dart';
import 'package:flags_app/core/redux/middlewares/navigation_middleware.dart';
import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:flags_app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

import 'reducers/reducers.dart';

Store<AppState> store() {
  return Store<AppState>(
    allReducers,
    initialState: const AppState(),
    middleware: [
      AppMiddleware(),
      AuthenticationMiddleware(),
      NavigationMiddleware(
        goRouter: getIt.get<GoRouter>(),
        navigatorKey: getIt.get<GlobalKey<NavigatorState>>(),
      ),
    ],
  );
}
