import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:redux/redux.dart';

extension StoreExtensions on Store<AppState> {
  void dispatches(List<dynamic> actions) {
    for (var item in actions) {
      dispatch(item);
    }
  }
}
