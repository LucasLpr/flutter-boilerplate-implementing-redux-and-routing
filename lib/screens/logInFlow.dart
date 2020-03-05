import 'package:boilerplate/connectors/LogInFlowStore.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/constants.dart';


class LogInFlow extends StatelessWidget {
  final String username;

  void onNavigateToLogOutFlow(context) {
    Navigator.pushReplacementNamed(context, LOGOUT_FLOW); //Same as a reset in React Navigation (a navigation with a stack is : Navigator.pushNamed())
  }

  LogInFlow({this.username});

  // ComponentDidMount
  void onInit(store) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: LogInFlowStore.connect(loginPage, onInit)
        ),
      )
    );
  }

Widget loginPage(BuildContext context, LogInFlowStore props) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In Flow'),
      ),
      body: Center(
        child: Text('Welcome home $username ! \n Your Email is : ' +  props.email),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          props.saveEmail('myEmail@myMail');
          // onNavigateToLogOutFlow(context); // action for disconnection
        },
        label: Text("Action set simple email"),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink
      )
    );
  }

}

