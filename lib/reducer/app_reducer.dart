import 'package:boilerplate/models/app_state.dart';
import 'package:boilerplate/reducer/auth_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    authState: authReducer(state.authState, action),
    isLoading: false
  );
}