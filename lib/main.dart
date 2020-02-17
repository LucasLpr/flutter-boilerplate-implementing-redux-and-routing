import 'package:flutter/material.dart';
import 'package:boilerplate/config/store.dart';
import 'package:boilerplate/router/router.dart';
import 'package:boilerplate/src/myApp.dart';

void main() {
  var store = createStore();
  RouterApp.setupRouter();
  runApp(
    new Boilerplate(store)
  );
}