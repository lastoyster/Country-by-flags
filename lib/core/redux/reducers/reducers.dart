import 'package:flags_app/core/redux/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

import 'auth_reducer.dart';

final allReducers = combineReducers([
  appReducer,
  authReducer,
]);
