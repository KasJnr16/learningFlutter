import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  // -------------functions----------------
  trySumbit() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      sumbitForm();
    } else {
      print("Error");
    }
  }

  sumbitForm() {
    print(firstName);
    print(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "First Name"),
                  key: const ValueKey("firstName"),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "First Name should not be Empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    firstName = value.toString();
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Last Name"),
                  key: const ValueKey("lastName"),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Last Name should not be Empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    lastName = value.toString();
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  key: const ValueKey("email"),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Email should not be Empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                  key: const ValueKey("password"),
                  validator: (value) {
                    if (value.toString().length <= 5) {
                      return "Minium lenght of password should be 6";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value.toString();
                  },
                ),
                TextButton(
                    onPressed: () {
                      trySumbit();
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
