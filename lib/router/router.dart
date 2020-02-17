import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:boilerplate/screens/loggedInFlow.dart';
import 'package:boilerplate/screens/loggedOutFlow.dart';

import 'package:boilerplate/utils/constants.dart';

class RouterApp {
  static Router router = Router();

  static Handler _loggedOutFlow = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
    LoggedOutFlow()
  );
  static Handler _loggedInFlow = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
    LoggedInFlow(username: params['username'][0])
  );

  static void setupRouter() {
    router.define(
      LOGGED_OUT_FLOW,
      handler: _loggedOutFlow,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      (LOGGED_IN_FLOW + '/:username'),
      handler: _loggedInFlow,
    );
  }
}