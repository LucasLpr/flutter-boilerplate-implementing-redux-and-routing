import 'package:flutter/material.dart';
import 'package:boilerplate/utils/constants.dart';

class LogOutFlow extends StatelessWidget {

  void onNavigateToLogInFlow(context) {
    var username = 'MyUsername';
    Navigator.pushReplacementNamed(context, (LOGIN_FLOW + '/$username')); //Same as a reset in React Navigation (a navigation with a stack is : Navigator.pushNamed())
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged Out Flow'),
      ),
      body: Center(
        child: Text("Please login"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          onNavigateToLogInFlow(context);
        },
      ),
    );
  }
}