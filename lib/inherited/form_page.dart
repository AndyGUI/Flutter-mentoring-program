import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/inherited/state_container.dart';

class UpdateUserScreen extends StatelessWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> firstNameKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> lastNameKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> emailKey =
      GlobalKey<FormFieldState<String>>();

  const UpdateUserScreen();

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: false,
          child: ListView(
            children: [
              TextFormField(
                initialValue: container.user.firstName,
                key: firstNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              TextFormField(
                initialValue: container.user.lastName,
                key: lastNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              TextFormField(
                initialValue: container.user.email,
                key: emailKey,
                style: Theme.of(context).textTheme.headline,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          proceedWithOnPressed(container, context);
        },
      ),
    );
  }

  void proceedWithOnPressed(
      StateContainerState container, BuildContext context) {
    final form = formKey.currentState;
    if (form.validate()) {
      var firstName = firstNameKey.currentState.value;
      var lastName = lastNameKey.currentState.value;
      var email = emailKey.currentState.value;

      if (firstName == '') {
        firstName = null;
      }
      if (lastName == '') {
        lastName = null;
      }
      if (email == '') {
        email = null;
      }

      container.updateUserInfo(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );

      Navigator.pop(context);
    }
  }
}
