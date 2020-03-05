import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:boilerplate/actions/auth_actions.dart';
import 'package:boilerplate/models/app_state.dart';

class LogInFlowStore {
  final String token;
  final String email;

  final Function(String) saveEmail;
  final Function checkToken;

  LogInFlowStore({
    this.token,
    this.email,
    this.saveEmail,
    this.checkToken
  });

  static StoreConnector connect(Widget Function(BuildContext, LogInFlowStore) widget, [Function(Store<AppState>) onInit]) {
    return new StoreConnector<AppState, LogInFlowStore>(
      // onInit is like a WillMount
      onInit: onInit != null ? (Store<AppState> store) => onInit(store) : null,
      // Convert the Store into a ViewModel(Here are the containers), passed to builder
      converter: (Store<AppState> store) {
        return LogInFlowStore(
          email: store.state.authState.email,
          token: store.state.authState.token,
          saveEmail: (email) => store.dispatch(new SaveEmailAction(email)),
          checkToken: () => store.dispatch(new CheckTokenAction())
        );
      },
      // Build a widget using the BuildContext and ViewModel from the converter
      builder: (context, props) => widget(context, props),
    );
  }
}