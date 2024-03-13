import 'package:flags_app/core/extensions/extensions.dart';
import 'package:flags_app/core/models/authentication/user.dart';
import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:flutter/widgets.dart';

mixin class ActionMapper {
  Store<AppState> get store => getIt.get<Store<AppState>>();

  GetIt get getIt => GetIt.instance;

  User get user => store.state.authState.user!;

  void dispatch(dynamic action) => store.dispatch(action);

  void dispatches(List<dynamic> actions) => store.dispatches(actions);
}

abstract class StatefulActionMapper extends StatefulWidget with ActionMapper {
  const StatefulActionMapper({super.key});
}

abstract class StatelessActionMapper extends StatelessWidget with ActionMapper {
  const StatelessActionMapper({super.key});
}
