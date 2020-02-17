import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:boilerplate/models/app_state.dart';

import 'package:boilerplate/utils/constants.dart';
import 'package:boilerplate/router/router.dart';

class Boilerplate extends StatelessWidget {
  final Store<AppState> store;

  Boilerplate(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: APP_NAME,
        initialRoute: LOGGED_OUT_FLOW,
        onGenerateRoute: RouterApp.router.generator,
      ),
    );
  }
}