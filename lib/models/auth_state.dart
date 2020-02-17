import 'package:flutter/material.dart';

@immutable
class AuthState{
  // Keys declaration
  final String email;
  final String token;

  // State declaration CTOR
  AuthState({
    @required this.email,
    @required this.token
  });

  // Initial State with Factory
  factory AuthState.initial(){
    return new AuthState(
      email: "",
      token: ""
    );
  }

  // used to update the state of this state == auth_state here
  AuthState copyWith({
    String email,
    String token
  }){
    return new AuthState(
      email: email ?? this.email,
      token: token ?? this.token
    );
  }

  // Operator override (surcharge)
  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is AuthState &&
      email == other.email &&
      token == other.token;

  @override
  String toString(){
    return 'AuthState:{email: $email, token: $token}';
  }
}