import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:boilerplate/containers/loggedInFlowContainer.dart';
import 'package:boilerplate/models/app_state.dart';
import 'package:boilerplate/utils/constants.dart';


class LoggedInFlow extends StatelessWidget {
  final String username;

  void onNavigateToLoggedOutFlow(context) {
    Navigator.pushReplacementNamed(context, LOGGED_OUT_FLOW); //Same as a reset in React Navigation (a navigation with a stack is : Navigator.pushNamed())
  }

  LoggedInFlow({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Container(
          child: new StoreConnector<AppState, LoggedInFlowContainer>(
            // onInit is like a WillMount
            onInit: (store){
            },
            // Convert the Store into a ViewModel(Here are the containers), passed to builder
            converter: (store) => LoggedInFlowContainer.fromStore(store),
            // Build a widget using the BuildContext and ViewModel from the converter
            builder: (context, props) => content(context, props),
          ),
        ),
      )
    );
  }

  Widget content(BuildContext context, LoggedInFlowContainer props) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In Flow'),
      ),
      body: Center(
        child: Text('Welcome home $username ! \n Your Email is : ' +  props.email),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          props.saveEmail('myEmail@myMail');
          // onNavigateToLoggedOutFlow(context); // action for disconnection
        },
        label: Text("Action set simple email"),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink
      )
    );
  }

}

