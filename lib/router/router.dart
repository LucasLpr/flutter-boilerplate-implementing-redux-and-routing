import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:boilerplate/screens/LogInFlow.dart';
import 'package:boilerplate/screens/LogOutFlow.dart';

import 'package:boilerplate/utils/constants.dart';

class RouterApp {
  static Router router = Router();

  static Handler _logOutFlow = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
    LogOutFlow()
  );
  static Handler _logInFlow = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
    LogInFlow(username: params['username'][0])
  );

  static void setupRouter() {
    router.define(
      LOGOUT_FLOW,
      handler: _logOutFlow,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      (LOGIN_FLOW + '/:username'),
      handler: _logInFlow,
    );
  }
}