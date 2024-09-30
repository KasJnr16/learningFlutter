import 'package:flutter/material.dart';
import 'package:thirty_days/services/authService.dart';
import 'package:intl/intl.dart';
import 'package:thirty_days/models/user.dart';
import 'package:thirty_days/widgets/forms/campusFieldWidget.dart';

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

// To view password
  bool _obscureText = true;
  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText; // Toggle password visibility
    });
  }

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

  // Function to clear form data
  void _clearForm() {
    _formKey.currentState!.reset(); // Reset the form fields
    _dateController.clear(); // Clear the date controller

    // Reset all variables
    setState(() {
      email = "";
      password = "";
      username = "";
      firstname = "";
      lastname = "";
      phone = 0;
      campusName = "";
      dateOfBirth = null;
    });
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
            height: 360,
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 5,
                  color: Colors.black,
                ),
              ],
            ),
            padding: EdgeInsets.all(25),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  !isLogin ? "Create an Account" : "Enter Account",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  !isLogin
                      ? "Join our marketplace for the best deals."
                      : "Welcome back to our marketplace.",
                  style: TextStyle(
                      fontSize: 21,
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
                                    hintStyle: TextStyle(fontSize: 21),
                                    hintText: "Username",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Rounded corners
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2), // Blue border on focus
                                    ),
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
                                    hintStyle: TextStyle(fontSize: 21),
                                    hintText: "First Name",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Rounded corners
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2), // Blue border on focus
                                    ),
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
                                    hintStyle: TextStyle(fontSize: 21),
                                    hintText: "Last Name",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Rounded corners
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2), // Blue border on focus
                                    ),
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
                                    hintStyle: TextStyle(fontSize: 21),
                                    hintText: "Phone Number",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Rounded corners
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2), // Blue border on focus
                                    ),
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
                                      hintStyle: TextStyle(fontSize: 21),
                                      hintText: "Date of Birth",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 16),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded corners
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2), // Blue border on focus
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.calendar_month_outlined,
                                            size: 30,
                                          ))),
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
                              ? CampusDropdown(
                                  onSaved: (String? value) {
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
                                    hintStyle: TextStyle(fontSize: 21),
                                    hintText: "Email",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Rounded corners
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2), // Blue border on focus
                                    ),
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
                                    hintStyle: TextStyle(fontSize: 21),
                                    hintText: "Email or Username or Phone",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Rounded corners
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2), // Blue border on focus
                                    ),
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
                            obscureText: _obscureText,
                            key: ValueKey("password"),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 21),
                              hintText: "Password",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Rounded corners
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2), // Blue border on focus
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 30,
                                ),
                                onPressed: _togglePasswordView,
                              ),
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
                          // SubmitButton for signup/login
                          Container(
                            width: double.infinity,
                            height: 70,
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  var _user = User(
                                    username: username,
                                    firstname: firstname,
                                    lastname: lastname,
                                    dateOfBirth: dateOfBirth,
                                    email: email,
                                    phone: phone.toString(),
                                    campusName: campusName,
                                    password: password,
                                  );

                                  bool res = false;

                                  if (!isLogin) {
                                    res = await AuthService.createAccount(
                                        _user, context);
                                  } else {
                                    res =
                                        await AuthService.login(_user, context);
                                  }

                                  if (res) {
                                    _clearForm();
                                  } else {
                                    // Handle error, maybe show a Snackbar or AlertDialog
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Error during authentication",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    ;
                                  }
                                }
                              },
                              child: Text(
                                !isLogin ? "Create Account" : "Login",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
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
                            child: Text(
                              isLogin
                                  ? "Don't have an account? Signup"
                                  : "Already have an accout? Click here",
                              style:
                                  TextStyle(fontSize: 21, color: Colors.black),
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
