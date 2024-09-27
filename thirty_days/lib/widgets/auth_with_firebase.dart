import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thirty_days/functions/authFunctions.dart';

class UserAuthWidget extends StatefulWidget {
  const UserAuthWidget({super.key});

  @override
  State<UserAuthWidget> createState() => _UserAuthWidgetState();
}

class _UserAuthWidgetState extends State<UserAuthWidget> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = "";
  String password = "";
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Auth"),
        //sign out
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                      key: ValueKey("username"),
                      decoration: InputDecoration(hintText: "Enter Username"),
                      validator: (value) {
                        if (value.toString().length < 3) {
                          return "Username is so small";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      },
                    )
                  : Container(),
              TextFormField(
                  key: ValueKey("email"),
                  decoration: InputDecoration(hintText: "Enter Email"),
                  validator: (value) {
                    if (!(value.toString().contains("@"))) {
                      return "Invalid email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  }),
              TextFormField(
                  obscureText: true,
                  key: ValueKey("password"),
                  decoration: InputDecoration(hintText: "Enter Password"),
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return "Password is weak";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  }),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          !isLogin
                              ? signup(email, password)
                              : signin(email, password);
                        }
                      },
                      child: !isLogin ? Text("Signup") : Text("Login"))),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? Text("Don't have an account? Signup")
                      : Text(
                          "Already Signed up? Login",
                          style: TextStyle(fontSize: 18),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
