import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
