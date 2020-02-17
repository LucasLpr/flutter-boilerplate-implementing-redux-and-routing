import 'package:redux/redux.dart';

import 'package:boilerplate/actions/auth_actions.dart';
import 'package:boilerplate/models/app_state.dart';

class LoggedInFlowContainer {
  final String token;
  final String email;

  final Function(String) saveEmail;
  final Function checkToken;

  LoggedInFlowContainer({
    this.token,
    this.email,
    this.saveEmail,
    this.checkToken
  });

  static LoggedInFlowContainer fromStore(Store<AppState> store){
    return LoggedInFlowContainer(
      email: store.state.authState.email,
      token: store.state.authState.token,
      saveEmail: (email) => store.dispatch(new SaveEmailAction(email)),
      checkToken: () => store.dispatch(new CheckTokenAction())
    );
  }
}