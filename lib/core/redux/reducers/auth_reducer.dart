import 'package:flags_app/core/redux/actions/authentication_action.dart';
import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:flags_app/core/redux/states/authentication_state.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AppState>(
  [
    TypedReducer<AppState, SetUserAction>(_onSetUserAction),
    TypedReducer<AppState, LogoutAction>(_onLogoutAction),
  ],
);

AppState _onSetUserAction(
  AppState state,
  SetUserAction action,
) {
  final authState = state.authState.copyWith(
    user: action.user,
  );
  return state.copyWith(
    authState: authState,
  );
}

AppState _onLogoutAction(
  AppState state,
  LogoutAction action,
) {
  return state.copyWith(
    authState: AuthenticationState.logout(),
  );
}
