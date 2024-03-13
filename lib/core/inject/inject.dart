import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:flags_app/core/redux/store.dart';
import 'package:flags_app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

Future<void> inject() async {
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton(
    GlobalKey<NavigatorState>(),
  );

  getIt.registerSingleton<GoRouter>(
    router,
  );

  getIt.registerSingleton<Store<AppState>>(
    store(),
  );

  getIt.registerSingleton<FlutterTts>(
    FlutterTts(),
  );
}
