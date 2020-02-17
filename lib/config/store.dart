import 'package:redux/redux.dart';
import 'package:boilerplate/reducer/app_reducer.dart';

import 'package:boilerplate/models/app_state.dart';

import 'package:redux_logging/redux_logging.dart';

Store<AppState> createStore(){
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      new LoggingMiddleware.printer()
    ]
  );
}