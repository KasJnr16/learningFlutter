import 'package:flutter/material.dart';
import 'package:thirty_days/controller/authController.dart';
import 'package:intl/intl.dart';
import 'package:thirty_days/models/user.dart';

class UserAuthWidget extends StatefulWidget {
  const UserAuthWidget({super.key});

  @override
  State<UserAuthWidget> createState() => _UserAuthWidgetState();
}

class _UserAuthWidgetState extends State<UserAuthWidget> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;

  //User details
  String email = "";
  String password = "";
  String username = "";
  String firstname = "";
  String lastname = "";
  int phone = 0;
  String campusName = "";
  DateTime? dateOfBirth;

  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dateOfBirth) {
      setState(() {
        dateOfBirth = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          // The fixed black background at the top
          Container(
            height: 300,
            padding: EdgeInsets.all(25),
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                !isLogin
                    ? Text(
                        "Create an Account",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    : Text(
                        "Enter Account",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                !isLogin
                    ? Text(
                        "Join our marketplace for the best deals.",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      )
                    : Text(
                        "Welcome back to our marketplace.",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      )
              ],
            ),
          ),
          // Expanded widget to make the second section scrollable
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.all(35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Conditional rendering based on isLogin state
                          !isLogin
                              ? TextFormField(
                                  key: ValueKey("username"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Username",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value.toString().length < 3) {
                                      return "Invalid Username";
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
                          SizedBox(
                            height: 25,
                          ),
                          !isLogin
                              ? TextFormField(
                                  key: ValueKey("firstname"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "First Name",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value.toString().length < 3) {
                                      return "Invalid Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      firstname = value!;
                                    });
                                  },
                                )
                              : Container(),
                          SizedBox(
                            height: 25,
                          ),
                          !isLogin
                              ? TextFormField(
                                  key: ValueKey("lastname"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Last Name",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value.toString().length < 3) {
                                      return "Invalid Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      lastname = value!;
                                    });
                                  },
                                )
                              : Container(),
                          SizedBox(
                            height: 25,
                          ),
                          !isLogin
                              ? TextFormField(
                                  key: ValueKey("phone"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Phone Number",
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        int.tryParse(value) == null ||
                                        value == 0) {
                                      return "Invalid Number";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      phone = int.parse(value!);
                                    });
                                  },
                                )
                              : Container(),
                          SizedBox(
                            height: 25,
                          ),
                          !isLogin
                              ? TextFormField(
                                  controller: _dateController,
                                  key: ValueKey("dateOfBirth"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Date",
                                    border: OutlineInputBorder(),
                                  ),
                                  onTap: () {
                                    // Prevents the default keyboard from showing up
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    _selectDate(context); // Open date picker
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Pick a Date";
                                    } else {
                                      return null;
                                    }
                                  },
                                )
                              : Container(),
                          SizedBox(
                            height: 25,
                          ),
                          !isLogin
                              ? TextFormField(
                                  key: ValueKey("campusName"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Campus",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value.toString().length < 3) {
                                      return "Provide Campus";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      campusName = value!;
                                    });
                                  },
                                )
                              : Container(),
                          SizedBox(
                            height: 25,
                          ),
                          // Email text field
                          !isLogin
                              ? TextFormField(
                                  key: ValueKey("email"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Email",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (!value.toString().contains("@")) {
                                      return "Invalid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      email = value!;
                                    });
                                  },
                                )
                              : TextFormField(
                                  key: ValueKey("email"),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Email or Username",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return "Invalid Email or Username";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      email = value!;
                                    });
                                  },
                                ),
                          SizedBox(
                            height: 25,
                          ),
                          // Password text field
                          TextFormField(
                            obscureText: true,
                            key: ValueKey("password"),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 20),
                              hintText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Invalid Password";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                password = value!;
                              });
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          // ElevatedButton for signup/login
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(10),
                                backgroundColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return Colors
                                          .black12; // Color when pressed
                                    }
                                    return Colors.black; // Default color
                                  },
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  var _user = User(
                                      username: username,
                                      firstname: firstname,
                                      lastname: lastname,
                                      dateOfBirth: dateOfBirth,
                                      email: email,
                                      phone: phone,
                                      campusName: campusName,
                                      password: password);

                                  !isLogin
                                      ? createAccount(_user)
                                      : login(_user);
                                }
                              },
                              child: !isLogin
                                  ? Text(
                                      "Create Account",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Switch between signup/login
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: isLogin
                                ? Text(
                                    "Don't have an account? Signup",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  )
                                : Text(
                                    "Already Signed up? Login",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
