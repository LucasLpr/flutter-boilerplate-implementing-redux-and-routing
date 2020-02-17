import 'package:boilerplate/actions/auth_actions.dart';
import 'package:boilerplate/models/auth_state.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState,SaveEmailAction>(_saveEmail),
  TypedReducer<AuthState,SaveTokenAction>(_saveToken),
  TypedReducer<AuthState,CheckTokenAction>(_checkToken)
]);

AuthState _saveEmail(AuthState state, SaveEmailAction action){
  return (state.copyWith(email: action.email));
}

AuthState _saveToken(AuthState state, SaveTokenAction action){
  return (state.copyWith(token: action.token));
}

AuthState _checkToken(AuthState state, CheckTokenAction action){
  return state;
}