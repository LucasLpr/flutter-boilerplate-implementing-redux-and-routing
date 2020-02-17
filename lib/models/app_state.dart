import 'package:flutter/foundation.dart';
import 'package:boilerplate/models/auth_state.dart';

@immutable
class AppState {
  final bool isLoading;
  final AuthState authState;

  // constructor
  AppState({
    @required this.authState,
    this.isLoading
  });

  factory AppState.initial(){
    return AppState(
      authState: AuthState.initial(),
      isLoading: false
    );
  }

  AppState copyWith({
    AuthState authState,
    bool isLoading
    }){
    return new AppState(
      authState: authState ?? this.authState,
      isLoading: isLoading ?? this.isLoading
    );
  }

  // use to print the App State -- toString method for the class, if not in the class, cannot possible to print it
  @override
  String toString(){
    return 'AppState:{isLoading: $isLoading, $authState}';
  }
}